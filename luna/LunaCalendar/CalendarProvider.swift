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
    
    func getCalendar() -> EKCalendar? {
        
        let calendars = eventStore.calendars(for: .event)
        let cicleCalendar = calendars.filter { calendar in
            return calendar.title == L10n.Constants.Content.Label.appName
        }
        
        //[MUDAR]: ver formas de pegar o calendario certo
        guard let calendar = cicleCalendar.first else {
            let calendarCreated = calendarCreator.create()
            return calendarCreated
        }
        return calendar
        
    }
}
