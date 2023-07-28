//
//  k.swift
//  luna
//
//  Created by sml on 28/07/23.
//

import EventKit

class CycleInformationsCalculator {
    func getFirstMenstruationDayFromLastPeriod(events: [EKEvent]) -> Date {
        let cycleEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value || event.title == CyclePhase.expectedMenstruation.value
        }

        return cycleEvents[cycleEvents.count-1].startDate
    }
    
    func calculateAverageMenstruationDuration(events: [EKEvent]) -> Int{
        let cycleEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value
        }
        
        // [MUDAR] ESSE NGC AQUI
        var auxCounter = 1
        for event in cycleEvents {
            auxCounter += event.startDate.daysBetween(event.endDate)
        }
        
        return auxCounter/cycleEvents.count
    }
    
    func calculateAverageCycleDuration(eventsBefore: [EKEvent], eventsAfter: [EKEvent]) -> Int {
        let cycleEvents = eventsBefore.filter { event in
            return event.title == CyclePhase.menstruation.value
        }

        if cycleEvents.count == 1 {
            return OnboardingUserCycleInformation.shared.cycleDuration
        }

        // [MUDAR] ESSE NGC AQUI
        var auxCounter = 0
        for event in 0...(cycleEvents.count-2) {
            let days = cycleEvents[event].startDate.daysBetween(cycleEvents[event+1].startDate)
            auxCounter += days
        }

        return auxCounter/(cycleEvents.count-1)
    }
}
