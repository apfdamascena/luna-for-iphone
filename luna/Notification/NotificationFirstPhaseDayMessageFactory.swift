//
//  NotificationFactoryMessage.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation


class NotificationFirstPhaseDayMessageFactory {
    
    static func create(for phase: CyclePhase) -> NotificationBody {
        switch phase {
        case .fertile:
            return NotificationBody(title: L10n.Constants.Content.Notification.FirstPhaseDay.Fertile.title ,
                                    body: L10n.Constants.Content.Notification.FirstPhaseDay.Fertile.body)
        case .folicular:
            return NotificationBody(title: L10n.Constants.Content.Notification.FirstPhaseDay.Folicular.title,
                                    body: L10n.Constants.Content.Notification.FirstPhaseDay.Folicular.body)
            
        case .luteal:
            return NotificationBody(title: L10n.Constants.Content.Notification.FirstPhaseDay.Luteal.title,
                                    body: L10n.Constants.Content.Notification.FirstPhaseDay.Luteal.body)
            
        case .pms:
            return NotificationBody(title: L10n.Constants.Content.Notification.FirstPhaseDay.Pms.title,
                                    body: L10n.Constants.Content.Notification.FirstPhaseDay.Pms.body)
            
        case .expectedMenstruation:
            return NotificationBody(title: L10n.Constants.Content.Notification.FirstPhaseDay.ExpectedMenstruation.title,
                                    body: L10n.Constants.Content.Notification.FirstPhaseDay.ExpectedMenstruation.body)
            
        default:
            return NotificationBody(title: "", body: "")
        }
    }
}
