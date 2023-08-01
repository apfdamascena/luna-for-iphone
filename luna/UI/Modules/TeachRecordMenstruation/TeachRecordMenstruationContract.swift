//
//  TeachRecordMenstruationContract.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewTeachRecordMenstruationProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterTeachRecordMenstruationProtocol {
    
    var view: PresenterToViewTeachRecordMenstruationProtocol? { get set }
    var router: PresenterToRouterTeachRecordMenstruationProtocol? { get set }
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterTeachRecordMenstruationProtocol {
    
}
