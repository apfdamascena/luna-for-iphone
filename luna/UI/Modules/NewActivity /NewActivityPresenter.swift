//
//  NewActivityPresenter.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import Foundation

class NewActivityPresenter: ViewToPresenterNewActivityProtocol {

    var view: PresenterToViewNewActivityProtocol?
    var interactor: PresenterToInteractorNewActivityProtocol?
    var router: PresenterToRouterNewActivityProtocol?
}

extension NewActivityPresenter: InteractorToPresenterNewActivityProtocol {
    
}
