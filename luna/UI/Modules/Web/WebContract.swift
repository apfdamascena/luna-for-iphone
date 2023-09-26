//
//  WebContract.swift
//  luna
//
//  Created by alexdamascena on 17/09/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewWebProtocol {
    
    func openWeb(on url: URL)
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterWebProtocol {
    
    var view: PresenterToViewWebProtocol? { get set }
    var interactor: PresenterToInteractorWebProtocol? { get set }
    var router: PresenterToRouterWebProtocol? { get set }
    
    func loadWebPage(at url: URL)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorWebProtocol {
    
    var presenter: InteractorToPresenterWebProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterWebProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterWebProtocol {
    
}
