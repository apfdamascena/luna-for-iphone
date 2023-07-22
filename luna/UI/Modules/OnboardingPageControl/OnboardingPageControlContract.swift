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
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOnboardingPageControlProtocol {
    
    var view: PresenterToViewOnboardingPageControlProtocol? { get set }
    var router: PresenterToRouterOnboardingPageControlProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOnboardingPageControlProtocol {
    
}
