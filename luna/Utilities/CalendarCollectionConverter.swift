//
//  CalendarCollectionConverter.swift
//  luna
//
//  Created by gabrielfelipo on 02/08/23.
//

import EventKit

class CalendarCollectionConverter {
    
    func turnEventsIntoDays(events: [EKEvent]) -> [String: String] {
        var daysEvent = [String: String]()

        for event in events {
            let eventDuration = event.startDate.daysBetween(event.endDate)
            for day in 0...eventDuration {
                let selectedDay = event.startDate.daysAfter(day)
                daysEvent[selectedDay.formatToString()] = event.title
            }
        }
        return daysEvent
    }
    
    func turnDaysIntoCyclePhase(events: [EKEvent]) -> [CyclePhaseViewModel] {
        let daysEvent = turnEventsIntoDays(events: events)
        
        var cyclePhases: [CyclePhaseViewModel] = []
        
        for day in stride(from: -HomeCollection.COLLECTION_RANGE/2, to: HomeCollection.COLLECTION_RANGE/2, by: 1) {
            var defaultPhase = CyclePhase.none
            let selectedDay = Date().daysAfter(day)
            
            let day = daysEvent[selectedDay.formatToString()]
            if (day != nil) {
                switch day {
                case CyclePhase.menstruation.value:
                    defaultPhase = .menstruation
                    
                case CyclePhase.folicular.value:
                    defaultPhase = .folicular
                    
                case CyclePhase.expectedMenstruation.value:
                    defaultPhase = .expectedMenstruation
                    
                case CyclePhase.fertile.value:
                    defaultPhase = .fertile
                    
                case CyclePhase.luteal.value:
                    defaultPhase = .luteal
                case CyclePhase.pms.value:
                    defaultPhase = .pms
                
                default:
                    defaultPhase = .none
                }
            }
            
            cyclePhases.append(CyclePhaseViewModel(phase: defaultPhase, day: selectedDay))
        }
        
        return cyclePhases
    }
    
}
