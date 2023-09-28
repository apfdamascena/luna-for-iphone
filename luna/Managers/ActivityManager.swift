//
//  ActivitysManager.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//

import UIKit

final class ActivityManager {
    
    static let shared = ActivityManager()
    private init (){}
    
    var wasSeen: Bool {
        return UserDefaults.standard.object(forKey: L10n.Constants.User.Key.forActivitiesWasSeen) != nil
    }
    
    var wasNotSeen: Bool {
        return UserDefaults.standard.object(forKey: L10n.Constants.User.Key.forActivitiesWasSeen) == nil
    }
    
    func userSawActivities() {
        UserDefaults.standard.set(true, forKey: L10n.Constants.User.Key.forActivitiesWasSeen)
    }
    
}
