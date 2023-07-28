//
//  CalculateCyclesService.swift
//  luna
//
//  Created by sml on 26/07/23.
//

// [MUDAR]: VER COMO FAZER PRA NAO REINSTANCIAR TUDO DE NOVO
// Daqui a 3 dias é diferente de estar menstruada por 3 dias

import EventKit

struct CycleInformations {
    let firstDayMenstruation: Date
    let averageMenstruationDuration: Int
    let averageCycleDuration: Int
    var lastDayMenstruation: Date? = nil
}

struct AnualCycleCalculator {
    // fazer disso um struct
    let cycleInformations: CycleInformations

    var monthsFromMenstruation: Int = 0
    let eventStore: EKEventStore
    
    init(eventStore: EKEventStore, cycleInformations: CycleInformations) {
        self.cycleInformations = cycleInformations
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
            if cycleInformations.lastDayMenstruation == nil {
                return calculatePhaseDate(CyclePhase.menstruation, 0, cycleInformations.averageMenstruationDuration-1)
            }
            return calculatePhaseDate(CyclePhase.menstruation, cycleInformations.firstDayMenstruation.daysBetween(cycleInformations.lastDayMenstruation!), cycleInformations.averageMenstruationDuration+1)
        }
        return calculatePhaseDate(CyclePhase.expectedMenstruation, 0, cycleInformations.averageMenstruationDuration-1)
    }
    
    private func calculateFolicularDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.folicular, cycleInformations.averageMenstruationDuration, 9)
    }
    
    private func calculateFertileDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.fertile, 10, 16)
    }
    
    private func calculateLutealDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.luteal, 17, cycleInformations.averageCycleDuration-8)
    }
    
    private func calculatePMSDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.pms, cycleInformations.averageCycleDuration-7, cycleInformations.averageCycleDuration-1)
    }
    
    private func calculatePhaseDate(_ phase: CyclePhase, _ firstDayDistanceFromCycle: Int, _ lastDayDistanceFromCycle: Int) -> LunaEvent {
        let firstDayValue = (cycleInformations.averageCycleDuration*monthsFromMenstruation)+firstDayDistanceFromCycle
        let lastDayValue = (cycleInformations.averageCycleDuration*monthsFromMenstruation)+lastDayDistanceFromCycle
        let firstDay = cycleInformations.firstDayMenstruation.daysAfter(firstDayValue)
        let lastDay = cycleInformations.firstDayMenstruation.daysAfter(lastDayValue)
        return LunaEvent(title: phase, startDate: firstDay, endDate: lastDay)
    }
}
