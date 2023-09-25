//
//  ActivitiesCalendarManager.swift
//  luna
//
//  Created by gabrielfelipo on 04/09/23.
//

import EventKit

class ActivitiesCalendarManager {
    
    private let eventStore = EKEventStore()
    private var calendar: EKCalendar?
    private var generalCalendarEventService: CalendarEventService?
    var lunaEventService: CalendarEventService?
    
    init(calendar: EKCalendar? = nil, lunaEventService: CalendarEventService? = nil) {
        let calendar = CalendarProvider(eventStore).getCalendar(calendarTitle: .appActivities)
        self.calendar = calendar
        let generalCalendar = CalendarProvider(eventStore).getCalendar(calendarTitle: .appName)
        self.generalCalendarEventService = CalendarEventService(with: eventStore, in: generalCalendar)
        self.lunaEventService = CalendarEventService(with: eventStore, in: calendar)
    }
    
    func createEvent(_ activitieEvent: ActivityEvent){
        lunaEventService?.createActivitie(activitieEvent)
    }
    
    func getMonthEventsStartingToday() -> [ActivityEvent] {
        guard let eventService = self.lunaEventService else { return [] }
        
        let endOfMonth = Date().endOfMonth()

        let events = eventService.getEventsByDate(firstDate: Date(), finalDate: endOfMonth)
        let eventsToReturn = events.map { event in
            let cycleEvent = generalCalendarEventService?.getEventsByDate(firstDate: event.startDate, finalDate: event.startDate)
            
            let phase = CyclePhase(rawValue: cycleEvent?.first?.title ?? "none") ?? CyclePhase.none
            
            return ActivityEvent(title: event.title, startDate: event.startDate, endDate: event.endDate, phase: phase)
        }
        return eventsToReturn
    }
    
    func getWeekEventsStartingToday() -> [ActivityEvent] {
        guard let eventService = self.lunaEventService else { return [] }
        
        let endOfWeek = Date().endOfWeek()

        let events = eventService.getEventsByDate(firstDate: Date(), finalDate: endOfWeek)
        
        let eventsToReturn = events.map { event in
            let cycleEvent = generalCalendarEventService?.getEventsByDate(firstDate: event.startDate, finalDate: event.startDate)
            
            let phase = CyclePhase(rawValue: cycleEvent?.first?.title ?? "none") ?? CyclePhase.none
            
            return ActivityEvent(title: event.title, startDate: event.startDate, endDate: event.endDate, phase: phase)
        }
        return eventsToReturn
    }
    
}
