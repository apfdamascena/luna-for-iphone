//
//  NotificationCenter.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class Notification {
    
    
    static let shared = Notification()
    
    let center = UNUserNotificationCenter.current()
    
    
    func requestAccess(){
        center.requestAuthorization(options: [.alert, .sound ]){ granted, error in
            if granted {
                print("permission ok")
            } else {
                print("permission deniedd")
            }
        }
    }
    
    
    func addNotification(at date: Date, with notification: UNMutableNotificationContent){
    
        var components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        components.hour = 12
        components.minute = 10
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: notification,
                                            trigger: trigger)
        center.add(request)
    }
    
    func removeAllNotifications(){
        center.removeAllPendingNotificationRequests()
    }
    
    
}
