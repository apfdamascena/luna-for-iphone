//
//  NotificationStation.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class NotificationStation {
    
    
    private let notificationFilter: NotificationFilter
    
    init() {
        self.notificationFilter = NotificationFilter()
    }
    
    func addScheduleNotification(for cycleDays: [CyclePhaseViewModel]){
        Notification.shared.removeAllNotifications()
        let daysForNotify = notificationFilter.execute(for: cycleDays)
        
        let (content, _) = daysForNotify[0]
        
        let content2 = UNMutableNotificationContent()
        content2.title = "Cheguei, mores  💅"
        content2.body = "Fase ovulatória à vista! A boa é evitar estresses hoje, hein? Saiba mais"
        
        Notification.shared.addNotification(at: Date(), with: content2)
        
        
    
        
//        daysForNotify.forEach { notification, date in
//            Notification.shared.addNotification(at: date,
//                                                with: notification)
//        }
        
        
        
        Notification.shared.center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print("request \(request)")
            }
        })
        
    
    }
}
