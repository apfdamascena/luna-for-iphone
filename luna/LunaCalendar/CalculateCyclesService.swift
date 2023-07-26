//
//  CalculateCyclesService.swift
//  luna
//
//  Created by sml on 26/07/23.
//

// [MUDAR]: VER COM ALEX COMO FAZER
// Daqui a 3 dias é diferente de estar menstruada por 3 dias
enum CyclePhase: String {
    case folicular = "⚡️ Fase folicular"
    case menstruation = "🩸 Menstruação"
    case luteal  = "⬛️ Fase lútea"
    case fertile =  "💓 Período fertil"
    case expectedMenstruation = "Menstruação Prevista"
    case pms = "😡 TPM"
}

import EventKit

struct CalculateCyclesService {
    let firstDayMenstruation: Date
    let averageMenstruationDuration: Int
    let averageCycleDuration: Int
    var monthsFromMenstruation: Int = 0
    var lastDayMenstruation: Date? = nil
    
    let eventStore: EKEventStore
    
    init(eventStore: EKEventStore, firstDayMenstruation: Date, averageMenstruationDuration: Int, averageCycleDuration: Int, lastDayMenstruation: Date?) {
        self.firstDayMenstruation = firstDayMenstruation
        self.averageMenstruationDuration = averageMenstruationDuration
        self.averageCycleDuration = averageCycleDuration
        self.lastDayMenstruation = lastDayMenstruation
        self.eventStore = eventStore
    }
    
    mutating func getPhases() -> [(String, Date, Date)]{
        var auxArray: [(String, Date, Date)] = []
        for _ in 1...12 {
            auxArray.append(contentsOf: [calculateMenstruationDate(),calculateFolicularDate(), calculateFertileDate(), calculateLutealDate(), calculatePMSDate()])
            monthsFromMenstruation += 1
        }
        return auxArray
    }
    
    func calculateMenstruationDate() -> (String, Date, Date) {
        if monthsFromMenstruation == 0 {
            if lastDayMenstruation == nil {
                return calculatePhaseDate(CyclePhase.menstruation, 0, averageMenstruationDuration-1)
            }
            return calculatePhaseDate(CyclePhase.menstruation, firstDayMenstruation.daysBetween(lastDayMenstruation!), averageMenstruationDuration+1)
        }
        return calculatePhaseDate(CyclePhase.expectedMenstruation, 0, averageMenstruationDuration-1)
    }
    
    private func calculateFolicularDate() -> (String, Date, Date){
        return calculatePhaseDate(CyclePhase.folicular, averageMenstruationDuration, 9)
    }
    
    private func calculateFertileDate() -> (String, Date, Date) {
        return calculatePhaseDate(CyclePhase.fertile, 10, 16)
    }
    
    private func calculateLutealDate() -> (String, Date, Date) {
        return calculatePhaseDate(CyclePhase.luteal, 17, averageCycleDuration-8)
    }
    
    private func calculatePMSDate() -> (String, Date, Date) {
        return calculatePhaseDate(CyclePhase.pms, averageCycleDuration-7, averageCycleDuration-1)
    }
    
    private func calculatePhaseDate(_ phase:CyclePhase, _ firstDayDistanceFromCycle: Int, _ lastDayDistanceFromCycle: Int) -> (String, Date, Date) {
        let firstDayValue = (averageCycleDuration*monthsFromMenstruation)+firstDayDistanceFromCycle
        let lastDayValue = (averageCycleDuration*monthsFromMenstruation)+lastDayDistanceFromCycle
        let firstDay = firstDayMenstruation.daysAfter(firstDayValue)
        let lastDay = firstDayMenstruation.daysAfter(lastDayValue)
        return (phase.rawValue, firstDay, lastDay)
    }
}
