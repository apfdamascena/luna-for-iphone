//
//  CalendarEventService.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit

struct LunaEvent {
    let title: CyclePhase
    let startDate: Date
    let endDate: Date
}

class CalendarEventService {
    private let eventStore: EKEventStore
    private let calendar: EKCalendar?
    
    init(with eventStore: EKEventStore, in calendar: EKCalendar?){
        self.eventStore = eventStore
        self.calendar = calendar
    }
    
    func createEvent(_ event: LunaEvent) {
        let newEvent = EKEvent(eventStore: self.eventStore)
        newEvent.title = event.title.value
        newEvent.startDate = event.startDate
        newEvent.endDate = event.endDate
        newEvent.calendar = self.calendar
        newEvent.isAllDay = true
        DispatchQueue.main.async {
            try? self.eventStore.save(newEvent, span: .thisEvent)
        }
    }
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> [EKEvent] {
        guard let calendar = calendar else { return [] }
        
        let predicate =  eventStore.predicateForEvents(withStart: firstDate, end: finalDate, calendars: [calendar])
        let events = eventStore.events(matching: predicate)
        
        return events
    }
    
    func lunaEventsExist() -> Bool {
        guard let calendar = calendar else { return false }
        let oneMonthAgo = Date(timeIntervalSinceNow: -30*24*3600)
        let oneMonthAfter = Date(timeIntervalSinceNow: 30*24*3600)
        let predicate =  eventStore.predicateForEvents(withStart: oneMonthAgo, end: oneMonthAfter, calendars: [calendar])
        let events = eventStore.events(matching: predicate)
        if events.count == 0 {
            return false
        }
        return true
    }
}
