//
//  BestActivityRouter.swift
//  luna
//
//  Created by sml on 12/09/23.
//  
//

import Foundation
import UIKit

class BestActivityRouter: PresenterToRouterBestActivityProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = BestActivityViewController()
        
        let presenter: ViewToPresenterBestActivityProtocol & InteractorToPresenterBestActivityProtocol = BestActivityPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = BestActivityRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = BestActivityInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushNewActivity(on view: PresenterToViewBestActivityProtocol) {
        let createEvent = CreateEventRouter.createModule()
        
        guard let bestActivityController = view as? BestActivityViewController else { return }
        bestActivityController.navigationController?.pushViewController(createEvent, animated: true)
    }
    
    
    
}
