//
//  HomeContract.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    
}
