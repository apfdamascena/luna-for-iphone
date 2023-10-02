//
//  LunaCalendarManager.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit

typealias PermissionResponse = ((Result<CalendarAccess, CalendarAccessError>) -> Void)

protocol CalendarManager {
    
    func requestAccessToCalendar(completion: @escaping PermissionResponse)
    
    func firstLoadElementsToCalendar(firstDayMenstruation: Date,
                                     averageMenstruationDuration: Int,
                                     averageCycleDuration: Int)
    
    func addCyclePhasesToCalendar(firstDayMenstruation: Date,
                                  averageMenstruationDuration: Int,
                                  averageCycleDuration: Int,
                                  isFirst: Bool,
                                  firstMenstruationTime: Int?)
    
    func transformExpectedToMenstruation()
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> (calendar: [EKEvent], hasAccess: Bool)
    
    func changeDayPhaseBy(selectedDate: Date) -> ChangeCycleResponse
    
    func adjustEventsInCalendar(selectedDate: Date, isRemove: Bool)
    
    func removeLunaCalendarOnOnboarding()
    
    func refreshLoadElementsToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int)

}

class LunaCalendarManager: CalendarManager  {
    
    private let eventStore = EKEventStore()
    private var calendar: EKCalendar?
    var lunaEventService: CalendarEventService?
    var cycleInformationsCalculator: CycleInformationsCalculator?
    
    init(
         lunaEventService: CalendarEventService? = nil,
         cycleInformationsCalculator: CycleInformationsCalculator? = nil) {
        
        let calendar = CalendarProvider(eventStore).getCalendar(calendarTitle: .appName)
        self.calendar = calendar
        self.lunaEventService = CalendarEventService(with: eventStore, in: calendar)
        self.cycleInformationsCalculator = CycleInformationsCalculator()
    }

    func requestAccessToCalendar(completion: @escaping PermissionResponse){
        
        eventStore.requestAccess(to: .event) {[weak self] success, error in
            guard error == nil,
                  success,
                  let calendarStore = self?.eventStore else {
                completion(.failure(CalendarAccessError.permissionDenied))
                return
            }
            
            let calendar = CalendarProvider(calendarStore).getCalendar(calendarTitle: .appName)
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
        return lunaEventService?.getEventsByDate(firstDate: daysBeforeDate, finalDate: finalDate).calendar
    }
    
    func lunaEventsExist() -> Bool {
        return lunaEventService?.lunaEventsExist() ?? false
    }
    
    func eventsAfter(daysAfter: Int, startDate: Date) -> [EKEvent]? {
        let daysAfterDate = startDate.daysAfter(daysAfter)
        return lunaEventService?.getEventsByDate(firstDate: startDate, finalDate: daysAfterDate).calendar
    }
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> (calendar: [EKEvent], hasAccess: Bool) {
        guard let eventService = self.lunaEventService else { return ([], false)}
        let events = eventService.getEventsByDate(firstDate: firstDate, finalDate: finalDate)
        return (events.calendar, events.hasAccess)
    }
    

    func firstLoadElementsToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        if lunaEventsExist() { return }
        addCyclePhasesToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, isFirst: true)
    }
    
    func refreshLoadElementsToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        if lunaEventsExist() { return }
        addCyclePhasesToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, isFirst: false)
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
            
            if event.startDate.formatToInt() > Date().formatToInt() || event.title != CyclePhase.expectedMenstruation || isFirst {
                      createEvent(event)
            } else {
                let event = LunaEvent(
                    title: phase.title,
                    startDate: Date().daysAfter(1),
                    endDate: phase.endDate)
                createEvent(event)
                let pmsEvent = LunaEvent(
                    title: CyclePhase.pms,
                    startDate: phase.startDate,
                    endDate: Date())
                createEvent(pmsEvent)
            }
        }
    }
    
    
    func adjustEventsInCalendar(selectedDate: Date, isRemove: Bool) {
        guard let eventService = self.lunaEventService else { return }
        guard let informationsCalculator = self.cycleInformationsCalculator else { return }
        let daysBefore = Date().daysBefore(HomeCollection.COLLECTION_RANGE/2)
        let tomorrowDate = Date().daysAfter(1)
        let eventsTomorrow = eventService.getEventsByDate(firstDate: tomorrowDate, finalDate: tomorrowDate).calendar
        let eventsToday = eventService.getEventsByDate(firstDate: Date(), finalDate: Date()).calendar
        

        let events = eventService.getEventsByDate(firstDate: daysBefore, finalDate: Date()).calendar

        informationsCalculator.saveLastMenstruationDuration(eventsBeforeToday: events, isRemove: isRemove)
        informationsCalculator.saveLastCycleDuration(events: events, tomorrowEvents: eventsTomorrow, todayEvents: eventsToday)
        informationsCalculator.saveFirstMenstruationDayFromLastPeriod(events: events)
        
        let lastDayMenstruation = UserCycleInformation.shared.lastMenstruation
        let menstruationDuration = UserCycleInformation.shared.menstruationDuration
        let cycleDuration = UserCycleInformation.shared.cycleDuration
        let dayAfterMenstruation = lastDayMenstruation.daysAfter(menstruationDuration+1)
        
        let lastMenstruationEvent = eventService.getEventsByDate(firstDate: lastDayMenstruation, finalDate: lastDayMenstruation.daysAfter(1)).calendar
        
        let lastMenstruationDuration = lastMenstruationEvent.first?.startDate.daysBetween(lastMenstruationEvent.first?.endDate ?? Date())
        let removeFromDate = lastMenstruationEvent.first?.endDate.daysAfter(1) ?? Date()

        removeFutureEvents(menstruationDate: removeFromDate)

        addCyclePhasesToCalendar(firstDayMenstruation: lastDayMenstruation, averageMenstruationDuration: menstruationDuration, averageCycleDuration: cycleDuration, isFirst: false, firstMenstruationTime: lastMenstruationDuration)
        changeLastMenstruationIfItIsToday()
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
    
    func removeLunaCalendarOnOnboarding() {
        lunaEventService?.removeCalendar()
    }
}
