//
//  NotificationPhaseFirstDay.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class NotificationPhaseFirstDay: NotificationFilterCommand {
    
    func execute(for cycleDays: [CyclePhaseViewModel]) -> [UNMutableNotificationContent] {
        return []
    }

}
