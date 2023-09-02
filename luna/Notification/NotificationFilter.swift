//
//  NotificationFilter.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications




class NotificationFilter: NotificationFilterCommand {
    
    private let commands: [NotificationFilterCommand] = [NotificationCurrentPhaseInformation()]
                                                          
    func execute(for cycleDays: [CyclePhaseViewModel]) -> NotificationFiltered {
        
        var schedules: NotificationFiltered  = []
        
        commands.forEach { command in
            let schedule = command.execute(for: cycleDays)
            schedules.append(contentsOf: schedule)
        }
        
        schedules.forEach{ (notification, date) in
            print("schedules \(notification.title) - \(date)")
        }
        
        return []
    }
    
    
}
