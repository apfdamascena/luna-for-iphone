//
//  FirstTimeNewActivityContract.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewFirstTimeNewActivityProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFirstTimeNewActivityProtocol {
    
    var view: PresenterToViewFirstTimeNewActivityProtocol? { get set }
    var router: PresenterToRouterFirstTimeNewActivityProtocol? { get set }
    
    func userTappedLetsGoButton()
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFirstTimeNewActivityProtocol {
    func pushNewActivity(on view: PresenterToViewFirstTimeNewActivityProtocol)
}
