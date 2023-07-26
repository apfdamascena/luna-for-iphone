//
//  OnboardingPageFlowContract.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewOnboardingPageFlowProtocol {
    
    func completeOnboardFlowDot(at currentPage: Int)
    
    func hideContinueAndBackButton()
    func showLastContinueButton()
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOnboardingPageFlowProtocol {
    
    var view: PresenterToViewOnboardingPageFlowProtocol? { get set }
    var interactor: PresenterToInteractorOnboardingPageFlowProtocol? { get set }
    var router: PresenterToRouterOnboardingPageFlowProtocol? { get set }
    
    func userTappedEndOnboardingButton()
    func onboardingFlowDotViewFor(_ currentPage: Int)
    
//    func hideContinueAndBackButton()
//    func showLastContinueButton()
    
    func userTappedOnboardingNextButton()
//    func userTappedOnboardingPreviousButton()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOnboardingPageFlowProtocol {
    
    var presenter: InteractorToPresenterOnboardingPageFlowProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOnboardingPageFlowProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOnboardingPageFlowProtocol {
    
    func pushHome(on view: PresenterToViewOnboardingPageFlowProtocol)
    
}
