//
//  NotificationStation.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation


class NotificationStation {
    
    
    private let notificationFilter: NotificationFilter
    
    init() {
        self.notificationFilter = NotificationFilter()
    }
    
    func addScheduleNotification(for cycleDays: [CyclePhaseViewModel]){
        
//        let daysForNotificate = notificationFilter.execute()
        
    }
    
    func removeAllScheduleNotification(){
        Notification.shared.removeAllNotifications()
    }
    
}
