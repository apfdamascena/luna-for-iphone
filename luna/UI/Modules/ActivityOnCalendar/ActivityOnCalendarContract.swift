//
//  ActivityOnCalendarContract.swift
//  luna
//
//  Created by alexdamascena on 19/09/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewActivityOnCalendarProtocol {
    
    func navigateToHomeView()
    func navigateToNewActivityView()
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterActivityOnCalendarProtocol {
    
    var view: PresenterToViewActivityOnCalendarProtocol? { get set }
    var router: PresenterToRouterActivityOnCalendarProtocol? { get set }
    
    func userTapGoHome()
    func userTapNewActivity()
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterActivityOnCalendarProtocol {
    
}
