//
//  RootScreenViewFactory.swift
//  luna
//
//  Created by alexdamascena on 26/07/23.
//

import UIKit

class RootScreenViewFactory {
    
    static func create() -> UINavigationController {
        var rootController = LandingPageRouter.createModule()
        
        if OnboardingManager.shared.wasSeen {
            rootController = HomeRouter.createModule()
        }
        
        return UINavigationController(rootViewController: rootController)
    }
}
