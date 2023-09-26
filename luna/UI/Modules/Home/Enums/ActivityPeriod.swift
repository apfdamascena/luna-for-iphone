//
//  ActivityPeriod.swift
//  luna
//
//  Created by alexdamascena on 13/09/23.
//

import Foundation

enum ActivityPeriod {
    
    case week
    case month
    
    init(_ value: Int){
        switch value {
        case 0:
            self = .week
        default:
            self = .month
        }
    }
}
