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
        OnboardingManager.shared.userSawOnboarding()
        
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
    
    func userTappedOnboardingPreviousButton(at page: Int) {
        interactor?.calculateOnboarding(forPreviousPage: page - 1)
    }
}

extension OnboardingPageFlowPresenter: InteractorToPresenterOnboardingPageFlowProtocol {
    
    func goToNextPage(_ page: Int) {
        view?.goToNextPage(page)
    }
    
    func goToPreviousPage(_ page: Int) {
        view?.goToPreviousPage(page)
    }
    
    func showEndOnboardingView(_ page: Int) {
        view?.goToNextPage(page)
        view?.showEndOnboardingView()
    }
    
    
}
