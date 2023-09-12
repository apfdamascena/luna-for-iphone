//
//  AnalyticsEvents.swift
//  luna
//
//  Created by sml on 04/09/23.
//

import Foundation

enum AnalyticsEvents: AnalyticsEventType {
    case clickPhaseCard(CyclePhase)
    case giveCalendarPermission(Bool)
    case openApp(CyclePhase)
}

extension AnalyticsEvents {

  var eventName: String {
    switch self {
    case .clickPhaseCard:
      return "click_phase_card"
    case .giveCalendarPermission:
        return "give_calendar_permission"
    case .openApp:
        return "open_app"
    }
  }
  
    var userInfo: [AnyHashable: Any?] {
        switch self {
        case .clickPhaseCard(let phase):
            return ["phase": phase.value]
        case .giveCalendarPermission(let accepted):
            return ["calendar_accepted": String(accepted)]
        case .openApp(let phase):
            return ["opened_phase": phase.value]
        }
    }
}
