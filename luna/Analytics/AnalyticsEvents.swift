//
//  AnalyticsEvents.swift
//  luna
//
//  Created by sml on 04/09/23.
//

import Foundation

enum AnalyticsEvents: AnalyticsEventType {
  
  case atHome
}

extension AnalyticsEvents {
    var eventName: String {
        switch self {
        case .atHome:
            return "user_at_home"
            
        }
    }
}
