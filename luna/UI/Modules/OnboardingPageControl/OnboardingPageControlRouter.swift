//
//  OnboardingPageControlRouter.swift
//  luna
//
//  Created by alexdamascena on 21/07/23.
//  
//

import Foundation
import UIKit

class OnboardingPageControlRouter: PresenterToRouterOnboardingPageControlProtocol {

    
    
    static func createModule() -> UIViewController {
        
        let viewController = OnboardingPageControlViewController(datasource: OnboardingPageControlDataSourceImpl())
        
        let presenter: ViewToPresenterOnboardingPageControlProtocol = OnboardingPageControlPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = OnboardingPageControlRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func pushHome(on view: PresenterToViewOnboardingPageControlProtocol) {
        let home = HomeRouter.createModule()
        
        guard let onboardingController = view as? OnboardingPageControlViewController else { return }
        onboardingController.navigationController?.pushViewController(home, animated: true)
    }
}
