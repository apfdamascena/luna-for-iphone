//
//  NotificationFirstDayMenstruation.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class NotificationFirstDayExpectedMenstruation: NotificationFilterCommand {
    
    func execute(for cycleDays: [CyclePhaseViewModel]) -> NotificationFiltered {
        
        let firstExpectedMenstruations = cycleDays.filter { cycleDay in
            return cycleDay.phase == .expectedMenstruation
        }
        
        let firstExpectedMenstruationNotifications = firstExpectedMenstruations.map{ expected in
    
            let notification = UNMutableNotificationContent()
            notification.title = "Ding Dong, cheguei 🩸"
            notification.body = "Você entrará na fase menstrual nos próximos dias. Registre em Luna!"
            return (notification, expected.day)
        }
        
        return firstExpectedMenstruationNotifications
        
    }
}

// eu tou em uma outra fase e meu proximo primeiro dia de menstruação vem logo em seguida.
// eu estou na menstruação e qual é o meu proximo dia de menstruação esperada?
