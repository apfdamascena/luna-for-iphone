//
//  TeachRecordMenstruationPresenter.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//  
//

import Foundation

class TeachRecordMenstruationPresenter: ViewToPresenterTeachRecordMenstruationProtocol {

    var view: PresenterToViewTeachRecordMenstruationProtocol?
    var interactor: PresenterToInteractorTeachRecordMenstruationProtocol?
    var router: PresenterToRouterTeachRecordMenstruationProtocol?
}

extension TeachRecordMenstruationPresenter: InteractorToPresenterTeachRecordMenstruationProtocol {
    
}
