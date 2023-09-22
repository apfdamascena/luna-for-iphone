//
//  FirstActivityManager.swift
//  luna
//
//  Created by alexdamascena on 22/09/23.
//

import Foundation

class FirstActivityManager {
    
    static let shared = FirstActivityManager()
    
    private init(){}
    
    var wasSeen: Bool {
        return UserDefaults.standard.object(forKey: L10n.Constants.User.Key.forOnboardingActivityWasSeen) != nil
    }
    
    func userSawFirstActivity(){
        UserDefaults.standard.set(true, forKey: L10n.Constants.User.Key.forOnboardingActivityWasSeen)
    }
}
