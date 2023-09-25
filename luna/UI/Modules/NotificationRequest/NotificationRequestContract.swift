//
//  NotificationRequestContract.swift
//  luna
//
//  Created by alexdamascena on 15/09/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewNotificationRequestProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNotificationRequestProtocol {
    
    var view: PresenterToViewNotificationRequestProtocol? { get set }
    var router: PresenterToRouterNotificationRequestProtocol? { get set }
    var interactor: PresenterToInteractorNotificationRequestProtocol? { get set }
    
    func removeCalendar()
}

protocol PresenterToInteractorNotificationRequestProtocol {
    
    func removeAllPhaseFromCalendar()
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNotificationRequestProtocol {
    
}
