//
//  LunaCalendarManager+Check.swift
//  luna
//
//  Created by sml on 21/08/23.
//

import EventKit

enum ChangeCycleResponse {
    
    case isMenstruation
    case hasMenstruationNearDate
    case noMenstruationNearSelectedDate
    case menstruationWillHaveMoreThanMaxDays
    case isInsideMenstruationEvent
    case err
}

extension LunaCalendarManager {
    func changeDayPhaseBy(selectedDate: Date) -> ChangeCycleResponse {
        guard let eventService = self.lunaEventService else { return ChangeCycleResponse.err }
        let dateIsMenstruation = eventService.isDateEqualTo(cyclePhase: .menstruation, selectedDate: selectedDate)
        
        if dateIsMenstruation {
            return removeMenstruation(selectedDate: selectedDate, eventService: eventService)
        }

        return addMenstruationOn(selectedDate: selectedDate, eventService: eventService)
    }
    
    func addMenstruationOn(selectedDate: Date, eventService: CalendarEventService) -> ChangeCycleResponse {
        let eventsAfter = eventService.eventsAfter(daysAfter: 7, startDate: selectedDate)
        let menstruationEventsAfter = eventsAfter.filter { event in
            return event.title == CyclePhase.menstruation.value
        }

        if menstruationEventsAfter.count > 0 {
            guard let eventToAdjust = menstruationEventsAfter.last else {
                return ChangeCycleResponse.err
            }
            return adjustMenstruationAfter(selectedDate: selectedDate, menstruationEvent: eventToAdjust,  eventService: eventService)
        }

        
        let eventsBefore = eventService.eventsBefore(daysBefore: 7, finalDate: selectedDate)
        
        let menstruationEventsBefore = eventsBefore.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        if menstruationEventsBefore.count > 0 {
            guard let eventToAdjust = menstruationEventsBefore.first else {
                return ChangeCycleResponse.err
            }
            return adjustMenstruationBefore(selectedDate: selectedDate, menstruationEvent: eventToAdjust,  eventService: eventService)

        }
        
        //chamar funcao de add novo ciclo
        return addMenstruation(selectedDate: selectedDate, eventService: eventService)
    }
    
    func adjustMenstruationAfter(selectedDate: Date, menstruationEvent: EKEvent, eventService: CalendarEventService) -> ChangeCycleResponse {
        eventService.removeEvent(eventId: menstruationEvent.eventIdentifier)
        
//        if selectedDate.daysBetween(menstruationEvent.endDate) > 10 {
//            return ChangeCycleResponse.menstruationWillHaveMoreThanMaxDays
//        }

        let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: selectedDate, endDate: menstruationEvent.endDate)
        eventService.createEvent(newMenstruationEvent)
        
        
        let eventsBeforeMenstruation = getEventsByDate(firstDate: selectedDate, finalDate: menstruationEvent.startDate)
        let notMenstruationEvents = eventsBeforeMenstruation.filter { event in
            return event.title != CyclePhase.menstruation.value
        }
        
        guard let eventToAdjust = notMenstruationEvents.first else {
            return ChangeCycleResponse.hasMenstruationNearDate
        }
        
        notMenstruationEvents.forEach { event in
            eventService.removeEvent(eventId: event.eventIdentifier)

        }

        let newEventToAdjust = LunaEvent(title: CyclePhase(rawValue: eventToAdjust.title) ?? CyclePhase.none, startDate: eventToAdjust.startDate, endDate: selectedDate.daysBefore(1))
        createEvent(newEventToAdjust)
        
        return ChangeCycleResponse.hasMenstruationNearDate
    }
    
    func adjustMenstruationBefore(selectedDate: Date, menstruationEvent: EKEvent, eventService: CalendarEventService) -> ChangeCycleResponse {
        
        eventService.removeEvent(eventId: menstruationEvent.eventIdentifier)
        
        let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: menstruationEvent.startDate, endDate: selectedDate)
        
        eventService.createEvent(newMenstruationEvent)
        
        let eventsAfterMenstruation = getEventsByDate(firstDate: menstruationEvent.endDate, finalDate: selectedDate)
        let notMenstruationEvents = eventsAfterMenstruation.filter { event in
            return event.title != CyclePhase.menstruation.value
        }
        
        guard let eventToAdjust = notMenstruationEvents.first else {
            return ChangeCycleResponse.hasMenstruationNearDate
        }
        
        notMenstruationEvents.forEach { event in
            eventService.removeEvent(eventId: event.eventIdentifier)
        }
        
        let newEventToAdjust = LunaEvent(title: CyclePhase(rawValue: eventToAdjust.title) ?? CyclePhase.none, startDate: selectedDate.daysAfter(1), endDate: eventToAdjust.endDate)
        
        createEvent(newEventToAdjust)
        
        return ChangeCycleResponse.hasMenstruationNearDate
    }
    
    func addMenstruation(selectedDate: Date, eventService: CalendarEventService) -> ChangeCycleResponse {
        
        let selectedEvent = eventService.getEventsByDate(firstDate: selectedDate, finalDate: selectedDate).first

        let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: selectedDate, endDate: selectedDate)

        createEvent(newMenstruationEvent)
        
        if (selectedEvent != nil) {
            eventService.removeEvent(eventId: selectedEvent!.eventIdentifier)
        }
        
        return ChangeCycleResponse.noMenstruationNearSelectedDate
    }
    
    func removeMenstruation(selectedDate: Date, eventService: CalendarEventService) -> ChangeCycleResponse {
        
        guard let selectedEvent = eventService.getEventsByDate(firstDate: selectedDate, finalDate: selectedDate).first else {
            return ChangeCycleResponse.err
        }
        
        if selectedDate.formatToString() == selectedEvent.startDate.formatToString() {
            eventService.removeEvent(eventId: selectedEvent.eventIdentifier)

            let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: selectedEvent.startDate.daysAfter(1), endDate: selectedEvent.endDate)
            
            createEvent(newMenstruationEvent)
            
            return ChangeCycleResponse.isMenstruation
        }
        else if selectedDate.formatToString() == selectedEvent.endDate.formatToString() {
            eventService.removeEvent(eventId: selectedEvent.eventIdentifier)
            let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: selectedEvent.startDate, endDate: selectedEvent.endDate.daysBefore(1))
            
            createEvent(newMenstruationEvent)
            
            return ChangeCycleResponse.isMenstruation
        }
        
        return ChangeCycleResponse.isInsideMenstruationEvent
    }
}
