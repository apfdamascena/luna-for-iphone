//
//  RootScreenViewFactory.swift
//  luna
//
//  Created by alexdamascena on 26/07/23.
//

import UIKit

class RootScreenViewFactory {
    
    static func createModule() -> UINavigationController {
        var rootController = LandingPageRouter.createModule()
        
        if OnboardingManager.shared.wasSeen {
            rootController = LunaTabBarViewController()
        }
        
        return UINavigationController(rootViewController: rootController)
    }
}
