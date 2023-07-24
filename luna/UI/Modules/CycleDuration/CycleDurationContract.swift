//
//  CycleDurationContract.swift
//  luna
//
//  Created by sml on 24/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCycleDurationProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCycleDurationProtocol {
    
    var view: PresenterToViewCycleDurationProtocol? { get set }
    var router: PresenterToRouterCycleDurationProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCycleDurationProtocol {
    
}
