//
//  LunaCalendarManager.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit

class LunaCalendarManager {
    private let eventStore = EKEventStore()
    private var calendar: EKCalendar?
    private var lunaEventService: CalendarEventService?
    
    init() {
        let calendar = CalendarProvider(eventStore).getCalendar()
        self.lunaEventService = CalendarEventService(with: eventStore, in: calendar)

    }
//    func requestAccessToCalendar() {
//        eventStore.requestAccess(to: .event) {[weak self] _, error in
//            guard error == nil,
//                  let calendarStore = self?.eventStore else { return }
//            let calendar = CalendarProvider(calendarStore).getCalendar()
//            self?.calendar = calendar
//            self?.lunaEventService = CalendarEventService(with: calendarStore, in: calendar)
//        }
//    }

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
    
    // [MUDAR]: VER COM ALEX COMO FAZER

    func firstLoadElementsToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int) {
        addCyclePhasesToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: averageMenstruationDuration, averageCycleDuration: averageCycleDuration, lastDayMenstruation: nil)
    }
    
    func addCyclePhasesToCalendar(firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, lastDayMenstruation: Date?) {

        var monthCycleService = CalculateCyclesService(eventStore: eventStore,
                                                  firstDayMenstruation: firstDayMenstruation,
                                                  averageMenstruationDuration: averageMenstruationDuration,
                                                  averageCycleDuration: averageCycleDuration, lastDayMenstruation: lastDayMenstruation)

        let phases = monthCycleService.getPhases()
        for phase in phases {
            let event = LunaEvent(title: phase.title, startDate: phase.startDate, endDate: phase.endDate)
            createEvent(event)
        }
    }
    
    func lunaEventsExist() -> Bool {
        return lunaEventService?.lunaEventsExist() ?? false
    }

}
