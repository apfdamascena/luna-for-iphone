//
//  NotificationPhaseFirstDay.swift
//  luna
//
//  Created by alexdamascena on 30/08/23.
//

import Foundation
import UserNotifications


class NotificationCurrentPhaseInformation: NotificationFilterCommand {
    
    func execute(for cycleDays: [CyclePhaseViewModel]) -> NotificationFiltered {
        
        let daysToNotify = cycleDays
            .enumerated()
            .filter { index, cycleDay in
                return index % 2 == 0
            }
            .map { index, cycleDay in
                let notification = UNMutableNotificationContent()
                let information = NotificationCurrentPhaseInformationMessageFactory.shared.create(for: cycleDay.phase)
                notification.title = information.title
                notification.body = information.body
                return (notification, cycleDay.day)
            }
        return daysToNotify
    }

}

