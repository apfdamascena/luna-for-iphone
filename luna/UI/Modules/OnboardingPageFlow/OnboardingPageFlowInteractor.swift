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
    
    private let flowCalculator = OnboardingViewFlow(numberOfPages: 4)
    
    
    func calculateOnboarding(forNextPage: Int){
        let page = flowCalculator.calculate(newCurrentPage: forNextPage)
        presenter?.goToNextPage(page)
    }
}
