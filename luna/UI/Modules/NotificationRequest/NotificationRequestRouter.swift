//
//  NotificationRequestRouter.swift
//  luna
//
//  Created by alexdamascena on 15/09/23.
//  
//

import Foundation
import UIKit

class NotificationRequestRouter: PresenterToRouterNotificationRequestProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = NotificationRequestViewController()
        
        let presenter: ViewToPresenterNotificationRequestProtocol = NotificationRequestPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NotificationRequestRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NotificationRequestInterator()
        
        return viewController
    }
    
}
