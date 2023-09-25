//
//  LandingPageContract.swift
//  luna
//
//  Created by alexdamascena on 25/09/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewLandingPageProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLandingPageProtocol {
    
    var view: PresenterToViewLandingPageProtocol? { get set }
    var interactor: PresenterToInteractorLandingPageProtocol? { get set }
    var router: PresenterToRouterLandingPageProtocol? { get set }
    
    func userTappedContinue()
    
    func removeLunaCalendar()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLandingPageProtocol {
    
    var presenter: InteractorToPresenterLandingPageProtocol? { get set }
    
    func removeAllPhasesFromCalendar()
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLandingPageProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLandingPageProtocol {
    
    func pushLastDayMenstruation(on view: PresenterToViewLandingPageProtocol)
}
