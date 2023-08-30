//
//  NotificationPhaseFirstDay.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications

//NotificationBody
class NotificationFactoryMessage {
    
    static func create(for phase: CyclePhase) -> NotificationBody {
        switch phase {
        case .fertile:
            return NotificationBody(title: "Cheguei, mores  💅" ,
                                    body: "Fase ovulatória à vista! A boa é evitar estresses hoje, hein? Saiba mais ")
        case .folicular:
            return NotificationBody(title: "Chegou a famosa ⚡️", body: "Ela mesmo, a Fase Folicular! Energia pode estar em alta hoje. Veja como aproveitar!")
            
        case .luteal:
            return NotificationBody(title: "Piscou e eu cheguei",
                                    body: "Fase Lútea on! Hormônios em alta. Saiba o que pode acontecer nessa fase 👉")
            
        case .luteal:
            return NotificationBody(title: "Sem gracinha hoje ", body: "Sintomas da TPM podem aparecer nos próximos dias. Saiba mais sobre essa fase 👉")
            
        default:
            return NotificationBody(title: "", body: "")
        }
    }
}


class NotificationPhaseFirstDay: NotificationFilterCommand {
    
    func execute(for cycleDays: [CyclePhaseViewModel]) -> [UNMutableNotificationContent] {
        
        var daysToNotify: [CyclePhaseViewModel] = []
        
        for index in 1..<cycleDays.count {
            let currentDay = cycleDays[index-1]
            let tomorrow = cycleDays[index]
            
            if currentDay.phase != tomorrow.phase {
                daysToNotify.append(tomorrow)
            }
        }
        
        
        let daysPhaseToNotify = daysToNotify.filter { days in
            let phase = days.phase
            
            return phase == .fertile || phase == .folicular || phase == .luteal || phase == .pms
        }
        
        
        
        
        
        return []
    }

}
