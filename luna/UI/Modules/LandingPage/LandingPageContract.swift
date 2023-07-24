//
//  LandingPageContract.swift
//  luna
//
//  Created by gabrielfelipo on 21/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewLandingPageProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLandingPageProtocol {
    
    var view: PresenterToViewLandingPageProtocol? { get set }
    var router: PresenterToRouterLandingPageProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLandingPageProtocol {
    
}
