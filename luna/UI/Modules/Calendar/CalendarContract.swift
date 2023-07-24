//
//  CalendarContract.swift
//  luna
//
//  Created by Cynara Costa on 21/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCalendarProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCalendarProtocol {
    
    var view: PresenterToViewCalendarProtocol? { get set }
    var router: PresenterToRouterCalendarProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCalendarProtocol {
    
}
