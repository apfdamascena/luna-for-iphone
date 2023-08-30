//
//  NotificationCenter.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications

struct NotificationBody {
    
    let title: String
    let body: String
    
}


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
    
    
    func addNotification(at date: Date, with body: NotificationBody){
    
    }
}
