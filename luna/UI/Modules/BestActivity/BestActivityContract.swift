//
//  BestActivityContract.swift
//  luna
//
//  Created by sml on 12/09/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewBestActivityProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBestActivityProtocol {
    
    var view: PresenterToViewBestActivityProtocol? { get set }
    var interactor: PresenterToInteractorBestActivityProtocol? { get set }
    var router: PresenterToRouterBestActivityProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBestActivityProtocol {
    
    var presenter: InteractorToPresenterBestActivityProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBestActivityProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBestActivityProtocol {
    
}
