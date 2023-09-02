//
//  NotificationStation.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications

protocol ScheduleNotificationStation {

    func addScheduleNotification(for cycleDays: [CyclePhaseViewModel])
}

protocol ScheduleNotificationFilterable {
    
    var notificationFilter: NotificationFilter { get }
}


class NotificationStation: ScheduleNotificationStation,
                           ScheduleNotificationFilterable {
    
    var notificationFilter: NotificationFilter
    
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
    }
}
