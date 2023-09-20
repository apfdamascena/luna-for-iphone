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
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNotificationRequestProtocol {
    
}
