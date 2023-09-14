//
//  CalendarProvider.swift
//  luna
//
//  Created by sml on 26/07/23.
//
import EventKit

class CalendarProvider {
    private let eventStore: EKEventStore
    private let calendarCreator: CalendarCreator

    init(_ eventStore: EKEventStore) {
        self.eventStore = eventStore
        self.calendarCreator = CalendarCreator(eventStore: eventStore)
    }
    
    func getCalendar() -> (generalCalendar: EKCalendar?, activitiesCalendar: EKCalendar?) {
        
        let calendars = eventStore.calendars(for: .event)
        var cicleCalendar = calendars.filter { calendar in
            return calendar.title == CalendarTitle.appName.title || calendar.title == CalendarTitle.appActivities.title
        }
        
        //[MUDAR]: ver formas de pegar o calendario certo
        guard let lunaCalendar = cicleCalendar.popLast() else {
            let activitiesCalendarCreated = calendarCreator.create(calendarTitle: .appActivities)
            let generalCalendarCreated = calendarCreator.create(calendarTitle: .appName)
            return (generalCalendarCreated, activitiesCalendarCreated)
        }
        
        guard let lunaActivitiesCalendar = cicleCalendar.first else {
            return (lunaCalendar, nil)
        }
        
        return (lunaCalendar, lunaActivitiesCalendar)
        
    }
}
