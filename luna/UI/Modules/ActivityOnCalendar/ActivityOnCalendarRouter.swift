//
//  ActivityOnCalendarRouter.swift
//  luna
//
//  Created by alexdamascena on 19/09/23.
//  
//

import Foundation
import UIKit

class ActivityOnCalendarRouter: PresenterToRouterActivityOnCalendarProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = ActivityOnCalendarViewController()
        
        let presenter: ViewToPresenterActivityOnCalendarProtocol = ActivityOnCalendarPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ActivityOnCalendarRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
