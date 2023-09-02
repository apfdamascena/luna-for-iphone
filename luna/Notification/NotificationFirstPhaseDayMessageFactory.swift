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
            return NotificationBody(title: "Cheguei, mores  💅" ,
                                    body: "Fase ovulatória à vista! A boa é evitar estresses hoje, hein? Saiba mais")
        case .folicular:
            return NotificationBody(title: "Chegou a famosa ⚡️", body: "Ela mesmo, a Fase Folicular! Energia pode estar em alta hoje. Veja como aproveitar!")
            
        case .luteal:
            return NotificationBody(title: "Piscou e eu cheguei",
                                    body: "Fase Lútea on! Hormônios em alta. Saiba o que pode acontecer nessa fase 👉")
            
        case .pms:
            return NotificationBody(title: "Sem gracinha hoje ", body: "Sintomas da TPM podem aparecer nos próximos dias. Saiba mais sobre essa fase 👉")
            
        case .expectedMenstruation:
            return NotificationBody(title: "Ding Dong, cheguei 🩸", body: "Você entrará na fase menstrual nos próximos dias. Registre em Luna!")
            
        default:
            return NotificationBody(title: "", body: "")
        }
    }
}
