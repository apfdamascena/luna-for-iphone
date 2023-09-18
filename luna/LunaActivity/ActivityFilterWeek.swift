//
//  ActivityFilterWeek.swift
//  luna
//
//  Created by alexdamascena on 14/09/23.
//

import Foundation


class ActivityFilterWeek: ActivityFilter {
    
    func filter(_ data: [ActivityCellViewModel]) -> [ActivityCellViewModel] {
        
        return [
            ActivityCellViewModel(title: "Aniversário de Alana",
                                              hourStart: "10:00",
                                              hourEnd: "12:00",
                                              day: Date(),
                                              phase: .fertile),
            
            ActivityCellViewModel(title: "Aniversário de Alana",
                                              hourStart: "10:00",
                                              hourEnd: "12:00",
                                              day: Date(),
                                              phase: .fertile),
            
        
        ]
    }
}
