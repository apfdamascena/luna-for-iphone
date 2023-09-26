//
//  CalendarEventService.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit

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
        try? self.eventStore.save(newEvent, span: .thisEvent)
    }
    
    func createActivitie(_ event: ActivityEvent) {
        let newEvent = EKEvent(eventStore: self.eventStore)
        newEvent.title = event.title
        newEvent.startDate = event.startDate
        newEvent.endDate = event.endDate
        newEvent.calendar = self.calendar
        newEvent.isAllDay = false
        try? self.eventStore.save(newEvent, span: .thisEvent)
    }
    
    func getEventsByDate(firstDate: Date, finalDate: Date) -> (calendar: [EKEvent], hasAccess: Bool) {
        guard let calendar = calendar else { return ([], false)}
        
        let predicate =  eventStore.predicateForEvents(withStart: firstDate, end: finalDate, calendars: [calendar])
        let events = eventStore.events(matching: predicate)
        return (events, true)
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
    
    func eventsBefore(daysBefore: Int, finalDate: Date) -> [EKEvent] {
        let daysBeforeDate = finalDate.daysBefore(daysBefore)
        return getEventsByDate(firstDate: daysBeforeDate, finalDate: finalDate).calendar
    }
    
    func eventsAfter(daysAfter: Int, startDate: Date) -> [EKEvent] {
        let daysAfterDate = startDate.daysAfter(daysAfter)
        return getEventsByDate(firstDate: startDate, finalDate: daysAfterDate).calendar
    }

    func removeEvent(eventId: String) {
        if let eventToDelete = self.eventStore.event(withIdentifier: eventId){
            do {
                try eventStore.remove(eventToDelete, span: .thisEvent)
            } catch let error as NSError {
                NSLog("failed to save event with error : \(error)")
            }
            NSLog("removed Event")
        }
    }
    
    func isDateEqualTo(cyclePhase: CyclePhase, selectedDate: Date) -> Bool {
        let teste = getEventsByDate(firstDate: selectedDate, finalDate: selectedDate).calendar
        if teste.first?.title == cyclePhase.value {
            return true
        }
        return false
    }
    
    func removeCalendar(){
        guard let calendar = calendar else { return }
        do {
            try eventStore.removeCalendar(calendar, commit: true)
        } catch {
            NSLog(error.localizedDescription)
        }
    }
    
}
