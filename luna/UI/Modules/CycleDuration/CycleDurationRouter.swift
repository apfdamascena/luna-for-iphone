//
//  CycleDurationRouter.swift
//  luna
//
//  Created by sml on 24/07/23.
//  
//

import Foundation
import UIKit

class CycleDurationRouter: PresenterToRouterCycleDurationProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = CycleDurationViewController(datasource: RangePickerViewDataSourceImpl(range: Onboarding.CYCLE_DURATION_RANGE))
        
        let presenter: ViewToPresenterCycleDurationProtocol = CycleDurationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CycleDurationRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
}
