//
//  FourthScreenRemoveAfterRouter.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import Foundation
import UIKit

class FourthScreenRemoveAfterRouter: PresenterToRouterFourthScreenRemoveAfterProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = FourthScreenRemoveAfterViewController()
        
        let presenter: ViewToPresenterFourthScreenRemoveAfterProtocol = FourthScreenRemoveAfterPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FourthScreenRemoveAfterRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
