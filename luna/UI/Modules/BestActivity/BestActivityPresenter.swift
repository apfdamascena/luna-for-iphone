//
//  BestActivityPresenter.swift
//  luna
//
//  Created by sml on 12/09/23.
//  
//

import Foundation

class BestActivityPresenter: ViewToPresenterBestActivityProtocol {

    var view: PresenterToViewBestActivityProtocol?
    var interactor: PresenterToInteractorBestActivityProtocol?
    var router: PresenterToRouterBestActivityProtocol?
}

extension BestActivityPresenter: InteractorToPresenterBestActivityProtocol {
    
}
