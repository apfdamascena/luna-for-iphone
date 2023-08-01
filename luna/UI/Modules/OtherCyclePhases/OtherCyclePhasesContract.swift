//
//  OtherCyclePhasesContract.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewOtherCyclePhasesProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOtherCyclePhasesProtocol {
    
    var view: PresenterToViewOtherCyclePhasesProtocol? { get set }
    var router: PresenterToRouterOtherCyclePhasesProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOtherCyclePhasesProtocol {
    
}
