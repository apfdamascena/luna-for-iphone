//
//  NewActivityContract.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import Foundation
import EventKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewActivityProtocol {
    
    func showFeedbackForUser()
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewActivityProtocol {
    
    var view: PresenterToViewNewActivityProtocol? { get set }
    var interactor: PresenterToInteractorNewActivityProtocol? { get set }
    var router: PresenterToRouterNewActivityProtocol? { get set }
    func userTappedContinueButton()
    func findBestPhase(activity: ActivityMetrics) -> EKEvent
    
    func isNotPossibleCreateActivityWithoutName()

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewActivityProtocol {
    
    var presenter: InteractorToPresenterNewActivityProtocol? { get set }
    
    func findBestPhaseFor(activity: ActivityMetrics) -> EKEvent?
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewActivityProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewActivityProtocol {
    func pushNewActivity(on view: PresenterToViewNewActivityProtocol) 
}
