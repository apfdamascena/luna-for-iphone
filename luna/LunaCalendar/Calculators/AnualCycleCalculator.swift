//
//  CalculateCyclesService.swift
//  luna
//
//  Created by sml on 26/07/23.
//

// [MUDAR]: VER COMO VAI SER PRA RECALCULAR O INICIO
// IDEIAS: SEMPRE SALVAR O TEMPO DE CICLO EXATO QUE A PESSOA COLOCOU (NAO O MINIMO)
// AI NO PRIMEIRO EXPECTED MENSTRUATION VAI COLOCAR A DATA DESSE CERTO

import EventKit

class AnualCycleCalculator {
    let cycleInformations: CycleInformations

    var monthsFromMenstruation: Int = 0
    let eventStore: EKEventStore
    let isFirst: Bool
    let firstMenstruationTime: Int?

    init(eventStore: EKEventStore, cycleInformations: CycleInformations, isFirst: Bool, firstMenstruationTime: Int? = nil) {
        self.cycleInformations = cycleInformations
        self.eventStore = eventStore
        self.isFirst = isFirst
        self.firstMenstruationTime = firstMenstruationTime
    }
    
    func getPhases() -> [LunaEvent]{
        var cyclePhases: [LunaEvent] = []
        var months =  Array(0...5)
        if isFirst {
            months = Array(0...11)
        }
        if isFirst {
            months.forEach { _ in
                cyclePhases.append(contentsOf: [calculateExpectedMenstruationDay(),calculateFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()])
                monthsFromMenstruation+=1
            }
        } else {
            if (firstMenstruationTime != nil) {
                cyclePhases.append(contentsOf: [calculateFirstFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()])
            } else {
                return []
            }
            
            monthsFromMenstruation += 1
            months.forEach { index in
                cyclePhases.append(contentsOf: [calculateExpectedMenstruationDay(),calculateFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()])
                monthsFromMenstruation+=1
            }
        }
        return cyclePhases
    }
    
    func menstruationDay() -> LunaEvent {
        
        return calculatePhaseDate(CyclePhase.menstruation, 0, 0)
    }
    
    func calculateExpectedMenstruationDay() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.expectedMenstruation, 0, cycleInformations.averageMenstruationDuration-1)
    }
    
    private func calculateFirstFolicularDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.folicular, (firstMenstruationTime! + 1) ?? cycleInformations.averageMenstruationDuration, 10)
    }
    
    private func calculateFolicularDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.folicular, cycleInformations.averageMenstruationDuration, 10)
    }
    
    private func calculateFertileDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.fertile, 11, 16)
    }
    
    private func calculateLutealDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.luteal, 17, cycleInformations.averageCycleDuration-8)
    }
    
    private func calculatePMSDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.pms, cycleInformations.averageCycleDuration-7, cycleInformations.averageCycleDuration-1)
    }
    
    private func calculatePossibleMenstruationDate() -> LunaEvent {
        return calculatePhaseDate(CyclePhase.possibleMenstruation, cycleInformations.averageCycleDuration-3, cycleInformations.averageCycleDuration-1)
    }

    private func calculatePhaseDate(_ phase: CyclePhase, _ firstDayDistanceFromCycle: Int, _ lastDayDistanceFromCycle: Int) -> LunaEvent {
        let firstDayValue = (cycleInformations.averageCycleDuration*monthsFromMenstruation)+firstDayDistanceFromCycle
        var lastDayValue = (cycleInformations.averageCycleDuration*monthsFromMenstruation)+lastDayDistanceFromCycle
        if !isFirst {
            lastDayValue += 1
        }
        let firstDay = cycleInformations.firstDayMenstruation.daysAfter(firstDayValue)
        let lastDay = cycleInformations.firstDayMenstruation.daysAfter(lastDayValue)
        return LunaEvent(title: phase, startDate: firstDay, endDate: lastDay)
    }
}
