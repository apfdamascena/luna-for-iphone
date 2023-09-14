//
//  ActivityFilterFactory.swift
//  luna
//
//  Created by alexdamascena on 14/09/23.
//

import Foundation

class ActivityFilterFactory {
    
    static func create(_ period: ActivityPeriod) -> ActivityFilter {
        
        if period == .month {
            return ActivityFilterMonth()
        }
        return  ActivityFilterWeek()
    }
}
