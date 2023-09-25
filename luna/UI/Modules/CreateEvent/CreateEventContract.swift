//
//  CreateEventContract.swift
//  luna
//
//  Created by sml on 20/09/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCreateEventProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCreateEventProtocol {
    
    var view: PresenterToViewCreateEventProtocol? { get set }
    var interactor: PresenterToInteractorCreateEventProtocol? { get set }
    var router: PresenterToRouterCreateEventProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCreateEventProtocol {
    
    var presenter: InteractorToPresenterCreateEventProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCreateEventProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCreateEventProtocol {
    
}
