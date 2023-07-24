//
//  OnboardingPageControlContract.swift
//  luna
//
//  Created by alexdamascena on 21/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewOnboardingPageControlProtocol {
    
    
    func completeOnboardFlowDot(at currentPage: Int)
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOnboardingPageControlProtocol {
    
    var view: PresenterToViewOnboardingPageControlProtocol? { get set }
    var router: PresenterToRouterOnboardingPageControlProtocol? { get set }
    
    func userTappedContinueButton()
    func completeOnboardFlowDot(at currentPage: Int)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOnboardingPageControlProtocol {
    
    func pushCalendarView(on view: PresenterToViewOnboardingPageControlProtocol)
    
}
