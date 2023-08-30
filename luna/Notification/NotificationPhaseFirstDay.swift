//
//  NotificationPhaseFirstDay.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


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
        
        let notification = daysPhaseToNotify.map{ days in
            let notification = UNMutableNotificationContent()
            
            let information = NotificationFactoryMessage.create(for: days.phase)
            notification.title = information.title
            notification.body = information.body
            
            return notification
        }
    
        return notification
    }

}
