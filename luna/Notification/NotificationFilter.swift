//
//  NotificationFilter.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation

class NotificationFilter: NotificationFilterCommand {
    
    private let commands: [NotificationFilterCommand] = [ NotificationFirstPhaseDay(), NotificationCurrentPhaseInformation()]
    
    func execute(for cycleDays: [CyclePhaseViewModel]) -> NotificationFiltered {
        
        var schedules: NotificationFiltered  = []
        
        commands.forEach { command in
            let schedule = command.execute(for: cycleDays)
            schedules.append(contentsOf: schedule)
        }
        
        return schedules
    }
}




