//
//  LunaCalendarManager.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit

enum CalendarAccess {
    case authorized
    case unauthorized
}

enum CalendarAccessError: Error {
    
    case permissionDenied
}

typealias PermissionResponse = ((Result<CalendarAccess, Error>) -> Void)

class LunaCalendarManager {
    
    private let eventStore = EKEventStore()
    private var calendar: EKCalendar?
    private var lunaEventService: CalendarEventService?
    private var cycleInformationsCalculator: CycleInformationsCalculator?
    
    init(calendar: EKCalendar? = nil, lunaEventService: CalendarEventService? = nil, cycleInformationsCalculator: CycleInformationsCalculator? = nil) {
        let calendar = CalendarProvider(eventStore).getCalendar()
        self.calendar = calendar
        self.lunaEventService = CalendarEventService(with: eventStore, in: calendar)
        self.cycleInformationsCalculator = CycleInformationsCalculator()
    }

    func requestAccessToCalendar(completion: @escaping PermissionResponse ){
        eventStore.requestAccess(to: .event) {[weak self] success, error in
            guard error == nil,
                  success,
                  let calendarStore = self?.eventStore else {
                completion(.failure(CalendarAccessError.permissionDenied))
                return
            }
            
            let calendar = CalendarProvider(calendarStore).getCalendar()
            self?.calendar = calendar
            self?.lunaEventService = CalendarEventService(with: calendarStore, in: calendar)
            self?.cycleInformationsCalculator = CycleInformationsCalculator()
            completion(.success(.authorized))
        }
    }

    func createEvent(_ lunaEvent: LunaEvent){
        lunaEventService?.createEvent(lunaEvent)
    }
    
    func eventsBefore(daysBefore: Int, finalDate: Date) -> [EKEvent]? {
        let daysBeforeDate = finalDate.daysBefore(daysBefore)
        return lunaEventService?.getEventsByDate(firstDate: daysBeforeDate, finalDate: finalDate)
    }
    
    func eventsAfter(daysAfter: Int, startDate: Date) -> [EKEvent]? {
        let daysAfterDate = startDate.daysAfter(daysAfter)
        return lunaEventService?.getEventsByDate(firstDate: startDate, finalDate: daysAfterDate)
    }
    

    func firstLoadElementsToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        if lunaEventsExist() { return }
        addCyclePhasesToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, lastDayMenstruation: nil)

    }

    func addCyclePhasesToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, lastDayMenstruation: Date?) {
        let cycleInformations = CycleInformations(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, lastDayMenstruation: lastDayMenstruation)
        
        let monthCycleService = AnualCycleCalculator(eventStore: eventStore,
                                                    cycleInformations: cycleInformations)

        let phases = monthCycleService.getPhases()
        for phase in phases {
            let event = LunaEvent(title: phase.title, startDate: phase.startDate, endDate: phase.endDate)
            createEvent(event)
        }
    }
    
    func lunaEventsExist() -> Bool {
        return lunaEventService?.lunaEventsExist() ?? false
    }
    
    func adjustEventsInCalendarBy(menstruationDate: Date) {
        removeFutureEvents(menstruationDate: menstruationDate)
        
        let menstruationDuration = OnboardingUserCycleInformation.shared.menstruationDuration
        let cycleDuration = OnboardingUserCycleInformation.shared.cycleDuration
        
        addCyclePhasesToCalendar(firstDayMenstruation: menstruationDate, averageMenstruationDuration: menstruationDuration, averageCycleDuration: cycleDuration, lastDayMenstruation: nil)
    }
    
    func hasMenstruationInCycle(menstruationDate: Date) -> Bool {
        guard let eventService = self.lunaEventService else {
            return false
        }
        
        var daysNearMenstruation = eventService.eventsAfter(daysAfter: OnboardingUserCycleInformation.shared.menstruationDuration + 5, startDate: menstruationDate)
        let daysBeforeMenstruation = eventService.eventsBefore(daysBefore: OnboardingUserCycleInformation.shared.menstruationDuration + 5, finalDate: menstruationDate)
        
        daysNearMenstruation.append(contentsOf: daysBeforeMenstruation)
        
        daysNearMenstruation = daysNearMenstruation.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        if daysNearMenstruation.count >= 1 {
            return true
        }
        
        return false
    }
    
    func removeFutureEvents(menstruationDate: Date)  {
        guard let eventService = self.lunaEventService else {
            return
        }
        // [MUDAR]: se clicar e for menstruation, tira o menstruation e bota expected msm
        
        var eventsToRemove = eventService.eventsAfter(daysAfter: 200, startDate: menstruationDate)

        eventsToRemove = eventsToRemove.filter { event in
            return event.title != CyclePhase.menstruation.value
        }

        for event in eventsToRemove {
            eventService.removeEvent(eventId: event.calendarItemIdentifier)
        }
    }
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> [EKEvent] {
        guard let eventService = self.lunaEventService else { return [] }
        return eventService.getEventsByDate(firstDate: firstDate, finalDate: finalDate)
    }

}
