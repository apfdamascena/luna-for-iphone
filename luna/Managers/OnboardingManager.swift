//
//  OnboardingManager.swift
//  luna
//
//  Created by alexdamascena on 26/07/23.
//

import Foundation


import Foundation

final class OnboardingManager {
    
    static let shared = OnboardingManager()
    private init(){}
    
    var wasSeen: Bool {
        return UserDefaults.standard.object(forKey: L10n.Constants.User.Key.forOnboardingWasSeen) != nil
    }
    
    func userSawOnboarding(){
        UserDefaults.standard.set(true, forKey: L10n.Constants.User.Key.forOnboardingWasSeen)
    }
}
