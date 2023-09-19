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
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterActivityOnCalendarProtocol {
    
    var view: PresenterToViewActivityOnCalendarProtocol? { get set }
    var router: PresenterToRouterActivityOnCalendarProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterActivityOnCalendarProtocol {
    
}
