//
//  LunaCalendarManager.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit

typealias PermissionResponse = ((Result<CalendarAccess, Error>) -> Void)

class LunaCalendarManager {
    
    private let eventStore = EKEventStore()
    private var calendar: EKCalendar?
    var lunaEventService: CalendarEventService?
    var cycleInformationsCalculator: CycleInformationsCalculator?
    
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
    
    func lunaEventsExist() -> Bool {
        return lunaEventService?.lunaEventsExist() ?? false
    }
    
    func eventsAfter(daysAfter: Int, startDate: Date) -> [EKEvent]? {
        let daysAfterDate = startDate.daysAfter(daysAfter)
        return lunaEventService?.getEventsByDate(firstDate: startDate, finalDate: daysAfterDate)
    }
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> [EKEvent] {
        guard let eventService = self.lunaEventService else { return [] }
        return eventService.getEventsByDate(firstDate: firstDate, finalDate: finalDate)
    }
    

    func firstLoadElementsToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        if lunaEventsExist() { return }
        addCyclePhasesToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, isFirst: true)
    }

    func addCyclePhasesToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, isFirst: Bool, firstMenstruationTime: Int? = nil) {
        let cycleInformations = CycleInformations(
            firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration)
        
        let monthCycleService = AnualCycleCalculator (
            eventStore: eventStore,
            cycleInformations: cycleInformations,
            isFirst: isFirst,
            firstMenstruationTime: firstMenstruationTime
        )

        let phases = monthCycleService.getPhases()
        for phase in phases {
            let event = LunaEvent(
                title: phase.title,
                startDate: phase.startDate,
                endDate: phase.endDate)
            createEvent(event)

        }
    }
    
    func adjustEventsInCalendar(selectedDate: Date, isRemove: Bool) {
        guard let eventService = self.lunaEventService else { return }
        guard let informationsCalculator = self.cycleInformationsCalculator else { return }
        let daysBefore = Date().daysBefore(HomeCollection.COLLECTION_RANGE/2)
        let tomorrowDate = Date().daysAfter(1)
        let eventsTomorrow = eventService.getEventsByDate(firstDate: tomorrowDate, finalDate: tomorrowDate)
        let eventsToday = eventService.getEventsByDate(firstDate: Date(), finalDate: Date())
        

        let events = eventService.getEventsByDate(firstDate: daysBefore, finalDate: Date())

        informationsCalculator.saveLastMenstruationDuration(eventsBeforeToday: events, isRemove: isRemove)
        informationsCalculator.saveLastCycleDuration(events: events, tomorrowEvents: eventsTomorrow, todayEvents: eventsToday)
        informationsCalculator.saveFirstMenstruationDayFromLastPeriod(events: events)
        
        let lastDayMenstruation = UserCycleInformation.shared.lastMenstruation
        let menstruationDuration = UserCycleInformation.shared.menstruationDuration
        let cycleDuration = UserCycleInformation.shared.cycleDuration
        let dayAfterMenstruation = lastDayMenstruation.daysAfter(menstruationDuration)
        removeFutureEvents(menstruationDate: dayAfterMenstruation)
        
        let lastMenstruationEvent = eventService.getEventsByDate(firstDate: lastDayMenstruation, finalDate: lastDayMenstruation.daysAfter(1))
        
        let lastMenstruationDuration = lastMenstruationEvent.first?.startDate.daysBetween(lastMenstruationEvent.first?.endDate ?? Date())
        
        addCyclePhasesToCalendar(firstDayMenstruation: lastDayMenstruation, averageMenstruationDuration: menstruationDuration, averageCycleDuration: cycleDuration, isFirst: false, firstMenstruationTime: lastMenstruationDuration)
    }
    
    func removeFutureEvents(menstruationDate: Date)  {
        guard let eventService = self.lunaEventService else {
            return
        }
        
        let eventsToRemove = eventService.eventsAfter(daysAfter: HomeCollection.COLLECTION_RANGE, startDate: menstruationDate)

        for event in eventsToRemove {
            eventService.removeEvent(eventId: event.calendarItemIdentifier)
        }
    }


}
