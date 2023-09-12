//
//  NewActivityContract.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewActivityProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewActivityProtocol {
    
    var view: PresenterToViewNewActivityProtocol? { get set }
    var interactor: PresenterToInteractorNewActivityProtocol? { get set }
    var router: PresenterToRouterNewActivityProtocol? { get set }
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewActivityProtocol {
    
    var presenter: InteractorToPresenterNewActivityProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewActivityProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewActivityProtocol {
    
}
