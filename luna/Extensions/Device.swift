//
//  Device.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//

import Foundation


enum Device {
    
    case iPhone14
    
    var width: Int {
        switch self {
        case .iPhone14:
            return 393
        }
    }
    
}
