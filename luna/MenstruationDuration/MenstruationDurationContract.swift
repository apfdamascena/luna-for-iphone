//
//  MenstruationDurationContract.swift
//  luna
//
//  Created by alexdamascena on 19/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewMenstruationDurationProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMenstruationDurationProtocol {
    
    var view: PresenterToViewMenstruationDurationProtocol? { get set }
    var router: PresenterToRouterMenstruationDurationProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMenstruationDurationProtocol {
    
}
