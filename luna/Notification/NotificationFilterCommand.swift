//
//  NotificationFilterCommand.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


protocol NotificationFilterCommand {
    
    func execute(for cycleDays: [CyclePhaseViewModel]) -> [UNMutableNotificationContent]
}
