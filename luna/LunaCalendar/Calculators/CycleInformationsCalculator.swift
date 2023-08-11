//
//  k.swift
//  luna
//
//  Created by sml on 28/07/23.
//

import EventKit
// [MUDAR] Nao ta sendo usado ainda
class CycleInformationsCalculator {
    func getFirstMenstruationDayFromLastPeriod(events: [EKEvent]) -> Date {
        let cycleEvents = events.filter { event in
            return event.title == CyclePhase.menstruation.value || event.title == CyclePhase.expectedMenstruation.value
        }

        return cycleEvents[cycleEvents.count-1].startDate
    }
    
    func getLastCycleDuration(events: [EKEvent]) -> Int{
        // [EM DESENVOLVIMENTO
        return 1
    }
    
    func getLastMenstruationDuration(eventsBefore: [EKEvent], eventsAfter: [EKEvent]) -> Int {
        // [EM DESENVOLVIMENTO]
        return 1
    }
}
