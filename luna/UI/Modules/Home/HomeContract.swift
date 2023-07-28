//
//  HomeContract.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    
    func userAllowedAccessCalendar()
    func userDeniedAccessCalendar()
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    func checkCalendarPermission()
    func loadUserCalendar()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func checkIfUserGivePermission(completion: @escaping PermissionResponse)
    func loadPhasesToUserCalendar()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    
    func accessAllowed()
    func accessDenied()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    
}
