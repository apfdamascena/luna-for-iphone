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
    var interactor: PresenterToInteractorTeachRecordMenstruationProtocol? { get set }
    var router: PresenterToRouterTeachRecordMenstruationProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorTeachRecordMenstruationProtocol {
    
    var presenter: InteractorToPresenterTeachRecordMenstruationProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterTeachRecordMenstruationProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterTeachRecordMenstruationProtocol {
    
}
