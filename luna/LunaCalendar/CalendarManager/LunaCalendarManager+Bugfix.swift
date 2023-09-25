//
//  LunaCalendarManager+Bugfix.swift
//  luna
//
//  Created by sml on 22/09/23.
//

import EventKit

extension LunaCalendarManager {
    func changeLastMenstruationIfItIsToday(){
        guard let eventService = self.lunaEventService else { return }
        
        let todayEvent = getEventsByDate(firstDate: Date(), finalDate: Date()).calendar
        var todayMenstruationEvents = todayEvent.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        guard let lastMenstruationEvent = todayMenstruationEvents.first else { return }

        
        let lastMenstruationDuration = lastMenstruationEvent.startDate.daysBetween(lastMenstruationEvent.endDate)+1
        
        let tomorrowEventArray = getEventsByDate(firstDate: Date().daysAfter(1), finalDate: Date().daysAfter(1)).calendar
        guard let tomorrowEvent = tomorrowEventArray.first else { return }

        let menstruationDuration = UserCycleInformation.shared.menstruationDuration

        if menstruationDuration > lastMenstruationDuration {
            let event = LunaEvent(title: .expectedMenstruation, startDate: Date().daysAfter(1), endDate: Date().daysAfter(menstruationDuration - lastMenstruationDuration))

            eventService.createEvent(event)
            
            let title = CyclePhase(rawValue: tomorrowEvent.title) ?? CyclePhase.folicular

            eventService.removeEvent(eventId: tomorrowEvent.eventIdentifier)

            let newEvent = LunaEvent(title: title, startDate: Date().daysAfter(menstruationDuration - lastMenstruationDuration + 1), endDate: tomorrowEvent.endDate)

            eventService.createEvent(newEvent)
        }

    }
}
