//
//  TestCalendarRecalculationRouter.swift
//  luna
//
//  Created by sml on 28/07/23.
//  
//

import Foundation
import UIKit

class TestCalendarRecalculationRouter: PresenterToRouterTestCalendarRecalculationProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = TestCalendarRecalculationViewController()
        
        let presenter: ViewToPresenterTestCalendarRecalculationProtocol = TestCalendarRecalculationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TestCalendarRecalculationRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
