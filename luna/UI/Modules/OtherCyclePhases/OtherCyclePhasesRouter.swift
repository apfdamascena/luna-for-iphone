//
//  OtherCyclePhasesRouter.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//  
//

import Foundation
import UIKit

class OtherCyclePhasesRouter: PresenterToRouterOtherCyclePhasesProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = OtherCyclePhasesViewController()
        
        let presenter: ViewToPresenterOtherCyclePhasesProtocol = OtherCyclePhasesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = OtherCyclePhasesRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
