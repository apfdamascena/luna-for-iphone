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
    case err
}

extension LunaCalendarManager {
    // [MUDAR] CODIGO MUITO FEIO
    
    func changeCycleBy(selectedDate: Date) -> ChangeCycleResponse {
        guard let eventService = self.lunaEventService else { return ChangeCycleResponse.err }
        let dateIsMenstruation = eventService.isDateEqualTo(cyclePhase: .menstruation, selectedDate: selectedDate)
        
        if dateIsMenstruation {
            // chama funcao de remover menstruacao
            return ChangeCycleResponse.isMenstruation
        }

        return addMenstruation(selectedDate: selectedDate, eventService: eventService)

    }
    
    func addMenstruation(selectedDate: Date, eventService: CalendarEventService) -> ChangeCycleResponse {
        let eventsAfter = eventService.eventsAfter(daysAfter: 7, startDate: selectedDate)
        let menstruationEventsAfter = eventsAfter.filter { event in
            return event.title == CyclePhase.menstruation.value
        }

        if menstruationEventsAfter.count > 0 {
            guard let eventToAdjust = menstruationEventsAfter.last else {
                return ChangeCycleResponse.err
            }
            return adjustMenstruationAfter(menstruationEvent: eventToAdjust, selectedDate: selectedDate, eventService: eventService)
        }

        let eventsBefore = eventService.eventsBefore(daysBefore: 7, finalDate: selectedDate)
        
        let menstruationEventsBefore = eventsBefore.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        if menstruationEventsBefore.count > 0 {
            // chamar funcao de retirar do calendar
            return ChangeCycleResponse.hasMenstruationNearDate
        }
        
        //chamar funcao de add novo ciclo
        return ChangeCycleResponse.noMenstruationNearSelectedDate
    }
    
    func adjustMenstruationAfter(menstruationEvent: EKEvent, selectedDate: Date, eventService: CalendarEventService) -> ChangeCycleResponse {
        
        eventService.removeEvent(eventId: menstruationEvent.eventIdentifier)
        
        if selectedDate.daysBetween(menstruationEvent.endDate) > 10 {
            return ChangeCycleResponse.menstruationWillHaveMoreThanMaxDays
        }

        let newMenstruationEvent = LunaEvent(title: CyclePhase.menstruation, startDate: selectedDate, endDate: menstruationEvent.endDate)
        eventService.createEvent(newMenstruationEvent)
        
        
        let eventsBeforeMenstruation = getEventsByDate(firstDate: selectedDate, finalDate: menstruationEvent.startDate)
        let notMenstruationEvents = eventsBeforeMenstruation.filter { event in
            return event.title != CyclePhase.menstruation.value
        }
        
        guard let eventToAdjust = notMenstruationEvents.last else {
            return ChangeCycleResponse.hasMenstruationNearDate
        }

        eventService.removeEvent(eventId: eventToAdjust.eventIdentifier)

        let newEventToAdjust = LunaEvent(title: CyclePhase.pms, startDate: eventToAdjust.startDate, endDate: selectedDate.daysBefore(1))
        createEvent(newEventToAdjust)
        
        return ChangeCycleResponse.hasMenstruationNearDate
    }
}
