//
//  NewActivityRouter.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import Foundation
import UIKit

class NewActivityRouter: PresenterToRouterNewActivityProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = NewActivityViewController()
        
        let presenter: ViewToPresenterNewActivityProtocol & InteractorToPresenterNewActivityProtocol = NewActivityPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NewActivityRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NewActivityInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
