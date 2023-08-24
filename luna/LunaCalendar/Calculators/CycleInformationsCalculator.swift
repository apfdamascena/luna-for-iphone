//
//  k.swift
//  luna
//
//  Created by sml on 28/07/23.
//

import EventKit
class CycleInformationsCalculator {
    func saveFirstMenstruationDayFromLastPeriod(events: [EKEvent]) {
        var menstruationEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        guard let lastMenstruation = menstruationEvents.last else { return }
        
        UserCycleInformation.shared.setLastMenstruation(lastMenstruation.startDate)
    }
    
    func saveLastCycleDuration(events: [EKEvent]) {
        var menstruationEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        if menstruationEvents.count > 1 {
            guard let lastMenstruation = menstruationEvents.popLast() else { return }
            guard let penultimateMenstruation = menstruationEvents.last else { return }
            
            var cycleDuration = penultimateMenstruation.startDate.daysBetween(lastMenstruation.startDate)
            
            cycleDuration = max(cycleDuration, 20)
            cycleDuration = min(cycleDuration, 32)

            UserCycleInformation.shared.setCycle(cycleDuration)
        }
        
    }
    
    func saveLastMenstruationDuration(eventsBeforeToday: [EKEvent], isRemove: Bool)  {
        var menstruationEvents = eventsBeforeToday.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
       
        guard let lastMenstruation = menstruationEvents.popLast() else { return }
        
        if lastMenstruation.endDate.daysBetween(Date()) < 1 && !isRemove {
            guard let penultimateMenstruation = menstruationEvents.last else { return }

            UserCycleInformation.shared.setMenstruation( penultimateMenstruation.startDate.daysBetween(penultimateMenstruation.endDate) + 1)
            return
        }
        
        var menstruationDuration = lastMenstruation.startDate.daysBetween(lastMenstruation.endDate) + 1
        
        menstruationDuration = min(menstruationDuration, 10)
        menstruationDuration = max(menstruationDuration, 4)

        
        UserCycleInformation.shared.setMenstruation(menstruationDuration)

        
    }
}
