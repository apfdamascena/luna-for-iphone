//
//  OnboardingPageFlowPresenter.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//  
//

import Foundation

class OnboardingPageFlowPresenter: ViewToPresenterOnboardingPageFlowProtocol {

    var view: PresenterToViewOnboardingPageFlowProtocol?
    var interactor: PresenterToInteractorOnboardingPageFlowProtocol?
    var router: PresenterToRouterOnboardingPageFlowProtocol?
    
    func userTappedEndOnboardingButton() {
        
        guard let pageViewController = view else { return }
        
        DispatchQueue.main.async {
            self.router?.pushHome(on: pageViewController)
        }
    }
    
    func userTappedOnboardingNextButton(at page: Int) {
        interactor?.calculateOnboarding(forNextPage: page+1)
    }
    
    func onboardingFlowDotViewFor(_ currentPage: Int) {
        view?.completeOnboardFlowDot(at: currentPage)
    }
}

extension OnboardingPageFlowPresenter: InteractorToPresenterOnboardingPageFlowProtocol {
    
    func goToNextPage(_ page: Int) {
        view?.goToNextPage(page)
    }
    
    
}
