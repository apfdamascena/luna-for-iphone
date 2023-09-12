//
//  FirstTimeNewActivityRouter.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//  
//

import Foundation
import UIKit

class FirstTimeNewActivityRouter: PresenterToRouterFirstTimeNewActivityProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = FirstTimeNewActivityViewController()
        
        let presenter: ViewToPresenterFirstTimeNewActivityProtocol = FirstTimeNewActivityPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FirstTimeNewActivityRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func pushNewActivity(on view: PresenterToViewFirstTimeNewActivityProtocol) {
        let newActivity = NewActivityRouter.createModule()
        
        guard let newActivityController = view as? FirstTimeNewActivityViewController else { return }
        newActivityController.navigationController?.pushViewController(newActivity, animated: true)
    }
    
}
