//
//  LastDayMenstruationContract.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//  
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewLastDayMenstruationProtocol {
   
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLastDayMenstruationProtocol {
    
    var view: PresenterToViewLastDayMenstruationProtocol? { get set }
    var router: PresenterToRouterLastDayMenstruationProtocol? { get set }
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLastDayMenstruationProtocol {
    
}
