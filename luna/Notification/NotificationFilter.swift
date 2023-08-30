//
//  NotificationFilter.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class NotificationFilter: NotificationFilterCommand {
    
    private let commands: [NotificationFilterCommand] = [ NotificationFirstDayExpectedMenstruation(),
                                                          NotificationPhaseFirstDay()]
                                                          
    func execute(for cycleDays: [CyclePhaseViewModel]) -> NotificationFiltered {
        
        var schedules: [(UNMutableNotificationContent, Date)] = []
        
        commands.forEach{ command in
            let schedule = command.execute(for: cycleDays)
            schedules.append(contentsOf: schedule)
        }
                  
        return schedules
    }
    
    
}
