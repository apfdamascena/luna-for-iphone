//
//  TestCalendarRecalculationContract.swift
//  luna
//
//  Created by sml on 28/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewTestCalendarRecalculationProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterTestCalendarRecalculationProtocol {
    
    var view: PresenterToViewTestCalendarRecalculationProtocol? { get set }
    var router: PresenterToRouterTestCalendarRecalculationProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterTestCalendarRecalculationProtocol {
    
}
