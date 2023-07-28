//
//  CalculateCyclesService.swift
//  luna
//
//  Created by sml on 26/07/23.
//

// [MUDAR]: VER COMO FAZER PRA NAO REINSTANCIAR TUDO DE NOVO
// Daqui a 3 dias é diferente de estar menstruada por 3 dias

import EventKit

struct CalculateCyclesService {
    // fazer disso um struct
    let firstDayMenstruation: Date
    let averageMenstruationDuration: Int
    let averageCycleDuration: Int
    var lastDayMenstruation: Date? = nil

    var monthsFromMenstruation: Int = 0
    let eventStore: EKEventStore
    
    init(eventStore: EKEventStore, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, lastDayMenstruation: Date?) {
        self.firstDayMenstruation = firstDayMenstruation
        self.averageMenstruationDuration = averageMenstruationDuration
        self.averageCycleDuration = averageCycleDuration
        self.lastDayMenstruation = lastDayMenstruation
        self.eventStore = eventStore
    }
    
    mutating func getPhases() -> [LunaEvent]{
        var cyclePhases: [LunaEvent] = []
        Array(0...11).forEach { _ in
            cyclePhases.append(contentsOf: [calculateMenstruationDate(),calculateFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()])
            monthsFromMenstruation+=1
        }
        return cyclePhases
    }
    
    func calculateMenstruationDate() -> LunaEvent {
        if monthsFromMenstruation == 0 {
            if lastDayMenstruation == nil {
                return calculatePhaseDate(CyclePhase.menstruation, 0, averageMenstruationDuration-1)
            }
            return calculatePhaseDate(CyclePhase.menstruation, firstDayMenstruation.daysBetween(lastDayMenstruation!), averageMenstruationDuration+1)
        }
        return calculatePhaseDate(CyclePhase.expectedMenstruation, 0, averageMenstruationDuration-1)
    }
    
    private func calculateFolicularDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.folicular, averageMenstruationDuration, 9)
    }
    
    private func calculateFertileDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.fertile, 10, 16)
    }
    
    private func calculateLutealDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.luteal, 17, averageCycleDuration-8)
    }
    
    private func calculatePMSDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.pms, averageCycleDuration-7, averageCycleDuration-1)
    }
    
    private func calculatePhaseDate(_ phase: CyclePhase, _ firstDayDistanceFromCycle: Int, _ lastDayDistanceFromCycle: Int) -> LunaEvent {
        let firstDayValue = (averageCycleDuration*monthsFromMenstruation)+firstDayDistanceFromCycle
        let lastDayValue = (averageCycleDuration*monthsFromMenstruation)+lastDayDistanceFromCycle
        let firstDay = firstDayMenstruation.daysAfter(firstDayValue)
        let lastDay = firstDayMenstruation.daysAfter(lastDayValue)
        return LunaEvent(title: phase, startDate: firstDay, endDate: lastDay)
    }
}
