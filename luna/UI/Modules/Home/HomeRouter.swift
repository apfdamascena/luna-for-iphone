//
//  HomeRouter.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = HomeViewController()
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
