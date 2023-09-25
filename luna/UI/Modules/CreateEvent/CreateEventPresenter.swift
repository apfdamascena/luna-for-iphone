//
//  CreateEventPresenter.swift
//  luna
//
//  Created by sml on 20/09/23.
//  
//

import Foundation

class CreateEventPresenter: ViewToPresenterCreateEventProtocol {

    var view: PresenterToViewCreateEventProtocol?
    var interactor: PresenterToInteractorCreateEventProtocol?
    var router: PresenterToRouterCreateEventProtocol?
}

extension CreateEventPresenter: InteractorToPresenterCreateEventProtocol {
    
}
