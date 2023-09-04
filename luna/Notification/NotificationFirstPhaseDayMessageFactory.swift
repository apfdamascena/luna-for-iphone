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
            return NotificationBody(title: "Chegou a famosa ⚡️", body: "Ela mesmo, a Fase Folicular! Energia pode estar em alta hoje. Veja como aproveitar!")
            
        case .luteal:
            return NotificationBody(title: "Piscou e eu cheguei",
                                    body: "Fase Lútea on! Hormônios em alta. Saiba o que pode acontecer nessa fase 👉")
            
        case .pms:
            return NotificationBody(title: "Sem gracinha hoje ", body: "Sintomas da TPM podem aparecer nos próximos dias. Saiba mais sobre essa fase 👉")
            
        case .expectedMenstruation:
            return NotificationBody(title: L10n.Constants.Content.Notification.FirstPhaseDay.ExpectedMenstruation.title,
                                    body: L10n.Constants.Content.Notification.FirstPhaseDay.ExpectedMenstruation.body)
            
        default:
            return NotificationBody(title: "", body: "")
        }
    }
}
