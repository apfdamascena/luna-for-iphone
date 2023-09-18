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
    var lunaEventService: CalendarEventService?
    
    init(calendar: EKCalendar? = nil, lunaEventService: CalendarEventService? = nil) {
        let calendar = CalendarProvider(eventStore).getCalendar()
        self.calendar = calendar.activitiesCalendar
        self.lunaEventService = CalendarEventService(with: eventStore, in: calendar.activitiesCalendar)
    }
    
    func createEvent(_ activitieEvent: ActivityEvent){
        lunaEventService?.createActivitie(activitieEvent)
    }
    
    func getMonthEventsStartingToday() -> [ActivityEvent] {
        guard let eventService = self.lunaEventService else { return [] }
        let endOfMonth = Date().endOfMonth()
        let events = eventService.getEventsByDate(firstDate: Date(), finalDate: endOfMonth)
        let eventsToReturn = events.map { event in
            return ActivityEvent(title: event.title, startDate: event.startDate, endDate: event.endDate)
        }
        return eventsToReturn
    }
    
}
