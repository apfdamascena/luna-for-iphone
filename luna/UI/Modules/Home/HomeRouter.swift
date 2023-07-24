//
//  HomeRouter.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = HomeViewController()
        
        let presenter: ViewToPresenterHomeProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
