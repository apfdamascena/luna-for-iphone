//
//  NotificationFilter.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class NotificationFilter: NotificationFilterCommand {
    
    private let commands: [NotificationFilterCommand] = [ NotificationPhaseFirstDay(),
                                                          NotificationFirstDayExpectedMenstruation() ]
    func execute() -> [UNMutableNotificationContent] {
        
        var schedules: [UNMutableNotificationContent] = []
        
        commands.forEach{ command in
            let schedule = command.execute()
            schedules.append(contentsOf: schedule)
        }
          
        return []
    }
    
    
}
