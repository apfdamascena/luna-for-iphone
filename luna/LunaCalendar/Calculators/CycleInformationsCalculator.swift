//
//  k.swift
//  luna
//
//  Created by sml on 28/07/23.
//

import EventKit
class CycleInformationsCalculator {
    func saveFirstMenstruationDayFromLastPeriod(events: [EKEvent]) {
        let menstruationEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        guard let lastMenstruation = menstruationEvents.last else { return }
        
        UserCycleInformation.shared.setLastMenstruation(lastMenstruation.startDate)
    }
    
    func saveLastCycleDuration(events: [EKEvent], tomorrowEvents: [EKEvent], todayEvents: [EKEvent]) {
        var menstruationEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        let tomorrowEvent = tomorrowEvents.first
        let todayEvent = todayEvents.first


        if tomorrowEvent?.title == CyclePhase.expectedMenstruation.value && todayEvent?.title != CyclePhase.menstruation.value {
            guard let lastMenstruation = menstruationEvents.popLast() else { return }
            
            var cycleDuration = tomorrowEvent?.startDate.daysBetween(lastMenstruation.startDate) ?? 28
            cycleDuration = max(cycleDuration, 24)
            cycleDuration = min(cycleDuration, 32)
            if menstruationEvents.count <= 1 {
                cycleDuration = UserCycleInformation.shared.cycleDurationFirstInput
            }

            UserCycleInformation.shared.setCycle(cycleDuration)
        } else if menstruationEvents.count > 1 {
            guard let lastMenstruation = menstruationEvents.popLast() else { return }
            guard let penultimateMenstruation = menstruationEvents.last else { return }
            
            var cycleDuration = penultimateMenstruation.startDate.daysBetween(lastMenstruation.startDate)
            
            cycleDuration = max(cycleDuration, 24)
            cycleDuration = min(cycleDuration, 32)

            UserCycleInformation.shared.setCycle(cycleDuration)
        } else {
            UserCycleInformation.shared.setCycle(UserCycleInformation.shared.cycleDurationFirstInput)
        }
        
    }
    
    func saveLastMenstruationDuration(eventsBeforeToday: [EKEvent], isRemove: Bool)  {
        var menstruationEvents = eventsBeforeToday.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
       
        guard let lastMenstruation = menstruationEvents.popLast() else { return }
        
        if lastMenstruation.endDate.formatToInt() == Date().formatToInt() {
            guard let penultimateMenstruation = menstruationEvents.last else {

                return
                
            }
            var penultimateDuration = penultimateMenstruation.startDate.daysBetween(penultimateMenstruation.endDate) + 1

            penultimateDuration = min(penultimateDuration, 7)
            penultimateDuration = max(penultimateDuration, 4)
            UserCycleInformation.shared.setMenstruation(penultimateDuration)

            return
        }
        
        var menstruationDuration = lastMenstruation.startDate.daysBetween(lastMenstruation.endDate) + 1

        menstruationDuration = min(menstruationDuration, 7)
        menstruationDuration = max(menstruationDuration, 4)

        
        UserCycleInformation.shared.setMenstruation(menstruationDuration)

        
    }
}
