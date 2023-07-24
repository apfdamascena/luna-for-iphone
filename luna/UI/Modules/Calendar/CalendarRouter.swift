//
//  CalendarRouter.swift
//  luna
//
//  Created by Cynara Costa on 21/07/23.
//  
//

import Foundation
import UIKit

class CalendarRouter: PresenterToRouterCalendarProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = CalendarViewController()
        
        let presenter: ViewToPresenterCalendarProtocol = CalendarPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CalendarRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
