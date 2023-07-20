//
//  MenstruationDurationRouter.swift
//  luna
//
//  Created by alexdamascena on 20/07/23.
//  
//

import Foundation
import UIKit

class MenstruationDurationRouter: PresenterToRouterMenstruationDurationProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = MenstruationDurationViewController()
        
        let presenter: ViewToPresenterMenstruationDurationProtocol = MenstruationDurationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MenstruationDurationRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}