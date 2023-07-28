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
        
        var monthCycleService = AnualCycleCalculator(eventStore: eventStore,
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
        let eventsBefore = lunaEventService?.eventsBefore(daysBefore: 100, finalDate: Date())
        let eventsAfter = lunaEventService?.eventsAfter(daysAfter: 100, startDate: Date())

        var firstDayMenstruation = cycleInformationsCalculator?.getFirstMenstruationDayFromLastPeriod(events: eventsBefore ?? [])

        let averageMenstruationDuration = cycleInformationsCalculator?.calculateAverageMenstruationDuration(events: eventsBefore ?? [])
        
        let averageCycleDuration = cycleInformationsCalculator?.calculateAverageCycleDuration(eventsBefore: eventsBefore ?? [], eventsAfter: eventsAfter ?? [])
       
        var lastDayMenstruation: Date? = nil

        print("AQ", firstDayMenstruation, averageMenstruationDuration, averageCycleDuration)

//        let startEndMenstruation = checkClickedMenstruation(menstruationDate: menstruationDate)
//
//        if startEndMenstruation != nil {
//            let (first, last) = startEndMenstruation!
//            firstDayMenstruation = first
//            lastDayMenstruation = last
//        }
//
//        lunaEventService?.removeElementsInCalendarBy(menstruationDate: menstruationDate)
//        // Mudar so os a partir de hoje, n anteriores
//        addCyclePhasesToCalendar(firstDayMenstruation: firstDayMenstruation ?? Date(), averageMenstruationDuration: averageMenstruationDuration ?? 0, averageCycleDuration: averageCycleDuration ?? 0,
//            lastDayMenstruation: lastDayMenstruation)
//        loadEventsOfCalendar()
    }
    
    func checkClickedMenstruation(menstruationDate: Date) -> (Date, Date)? {
        guard let eventService = self.lunaEventService else {
            return nil
        }
        
        let eventsBeforeMenstruationDate = eventService.eventsBefore(daysBefore: 100, finalDate: Date())

        var eventsToRemove = eventsBeforeMenstruationDate.filter { event in
            return event.title != CyclePhase.menstruation.value
        }

        let eventsOneDayBeforeMenstruation = eventService.eventsBefore(daysBefore: 1, finalDate: menstruationDate)
        let eventsOneDayAfterMenstruation = eventService.eventsAfter(daysAfter: 1, startDate: menstruationDate)
        

//        var newEventStartDate = menstruationDate
//        var newEventEndDate = menstruationDate
//        var returnNil = true
////
//        if eventsOneDayBeforeMenstruation.count > 0 {
//            let lastIndex = eventsOneDayBeforeMenstruation.count-1
//            if eventsOneDayBeforeMenstruation[lastIndex].title == CyclePhase.menstruation.value {
//                newEventStartDate = eventsOneDayBeforeMenstruation[lastIndex].startDate
//                eventsToRemove.append(eventsOneDayBeforeMenstruation[lastIndex])
//                returnNil = false
//            }
//        }
//
//        if eventsOneDayAfterMenstruation.count > 0 {
//            if eventsOneDayAfterMenstruation[0].title == CyclePhase.menstruation.value {
//                newEventEndDate = eventsOneDayAfterMenstruation[0].endDate
//                eventsToRemove.append(eventsOneDayAfterMenstruation[0])
//                returnNil = false
//            }
//        }
//
//        for event in eventsToRemove {
//            eventService.removeEvent(eventId: event.calendarItemIdentifier)
//        }
//
//        if returnNil == false {
//            return (newEventStartDate, newEventEndDate)
//        }
        return nil
    }

}
