//
//  OnboardingPageFlowInteractor.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//  
//

import Foundation

class OnboardingPageFlowInteractor: PresenterToInteractorOnboardingPageFlowProtocol {

    var presenter: InteractorToPresenterOnboardingPageFlowProtocol?
    private let flowCalculator = OnboardingViewFlow(numberOfPages: OnboardingInformation.NUMBER_PAGES)
    
    func calculateOnboarding(forNextPage: Int){
        let page = flowCalculator.calculate(newCurrentPage: forNextPage)
        
        if page == OnboardingInformation.NUMBER_PAGES_0_BASE {
            presenter?.showEndOnboardingView(page)
        } else {
            presenter?.goToNextPage(page)
        }
    }
    
    func calculateOnboarding(forPreviousPage: Int){
        let page = flowCalculator.calculate(newCurrentPage: forPreviousPage)
        
        if page < 0 {
            presenter?.goToLandingPage()
        } else {
            presenter?.goToPreviousPage(page)
        }
    }
}
