//
//  LunaCalendarManager+Verifications.swift
//  luna
//
//  Created by sml on 16/08/23.
//

import EventKit

extension LunaCalendarManager {
    func transformExpectedToMenstruation() {
        guard let eventService = self.lunaEventService else { return }
        
        guard let eventsBefore = eventsBefore(daysBefore: HomeCollection.COLLECTION_RANGE/2, finalDate: Date()) else {
            return
        }

        var expectedMenstruationEvents = eventsBefore.filter { event in
            return event.title == CyclePhase.expectedMenstruation.value
        }
        
        guard let lastEvent = expectedMenstruationEvents.last else { return }
        
        if lastEvent.endDate > Date() {
            let eventRemoved = expectedMenstruationEvents.removeLast()
            eventService.removeEvent(eventId: eventRemoved.eventIdentifier)
            
            let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: eventRemoved.startDate, endDate: Date())
            eventService.createEvent(newMenstruationEvent)
            
            let newExpectedMenstruationEvent = LunaEvent(title: CyclePhase.expectedMenstruation, startDate: Date().daysAfter(1), endDate: eventRemoved.endDate)
            eventService.createEvent(newExpectedMenstruationEvent)
        }
        
        let _ = expectedMenstruationEvents.map { event in
            eventService.removeEvent(eventId: event.eventIdentifier)
            let newEvent = LunaEvent(title: CyclePhase.menstruation, startDate: event.startDate, endDate: event.endDate)
            eventService.createEvent(newEvent)
        }
    }
}
