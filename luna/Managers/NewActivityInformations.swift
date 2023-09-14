//
//  NewActivityInformations.swift
//  luna
//
//  Created by sml on 14/09/23.
//

import Foundation

class NewActivityInformations {
    
    static let shared = NewActivityInformations()
    
    var phase: CyclePhase = .menstruation
    var dateInterval: DateInterval = DateInterval(start: Date(), end: Date())
    
    private init(){}
    
    func setDateInterval(_ dateInterval: DateInterval) {
        self.dateInterval = dateInterval
    }
    
    func setBestPhase(_ bestPhase: CyclePhase) {
        self.phase = bestPhase
    }
 
}
