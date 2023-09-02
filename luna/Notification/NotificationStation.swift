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
    
        daysForNotify.forEach { notification, date in
            Notification.shared.addNotification(at: date,
                                                with: notification)
        }
        
    
        Notification.shared.center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print("request \(request)")
            }
        })
        
    
    }
}
