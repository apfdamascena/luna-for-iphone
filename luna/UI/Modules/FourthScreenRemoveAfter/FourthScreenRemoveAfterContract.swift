//
//  FourthScreenRemoveAfterContract.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewFourthScreenRemoveAfterProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterFourthScreenRemoveAfterProtocol {
    
    var view: PresenterToViewFourthScreenRemoveAfterProtocol? { get set }
    var router: PresenterToRouterFourthScreenRemoveAfterProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterFourthScreenRemoveAfterProtocol {
    
}
