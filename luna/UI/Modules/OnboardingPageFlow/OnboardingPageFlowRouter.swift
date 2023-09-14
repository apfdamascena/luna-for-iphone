//
//  OnboardingPageFlowRouter.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//  
//

import Foundation
import UIKit

class OnboardingPageFlowRouter: PresenterToRouterOnboardingPageFlowProtocol {

    
    static func createModule() -> UIViewController {
        
        let viewController = OnboardingPageFlowViewController(datasource: OnboardingPageControlDataSourceImpl())
        
        let presenter: ViewToPresenterOnboardingPageFlowProtocol & InteractorToPresenterOnboardingPageFlowProtocol = OnboardingPageFlowPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = OnboardingPageFlowRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = OnboardingPageFlowInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushHome(on view: PresenterToViewOnboardingPageFlowProtocol) {
        let home = LunaTabBarViewController()
        
        guard let onboardingController = view as? OnboardingPageFlowViewController else { return }
        onboardingController.navigationController?.pushViewController(home, animated: true)
    }
    
    func popToLandingPage(on view: PresenterToViewOnboardingPageFlowProtocol) {
        guard let onboardingController = view as? OnboardingPageFlowViewController else { return }
        onboardingController.navigationController?.popViewController(animated: true)
    }
    
}
