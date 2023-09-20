//
//  WebRouter.swift
//  luna
//
//  Created by alexdamascena on 17/09/23.
//  
//

import Foundation
import UIKit

class WebRouter: PresenterToRouterWebProtocol {
    
    static func createModule(for page: URL) -> UIViewController {
        
        let viewController = WebViewController(url: page)

        let presenter: ViewToPresenterWebProtocol & InteractorToPresenterWebProtocol = WebPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = WebRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = WebInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
