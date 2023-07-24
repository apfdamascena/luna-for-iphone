//
//  LandingPageRouter.swift
//  luna
//
//  Created by gabrielfelipo on 21/07/23.
//  
//

import Foundation
import UIKit

class LandingPageRouter: PresenterToRouterLandingPageProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = LandingPageViewController()
        
        let presenter: ViewToPresenterLandingPageProtocol = LandingPagePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LandingPageRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
