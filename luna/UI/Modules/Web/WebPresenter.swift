//
//  WebPresenter.swift
//  luna
//
//  Created by alexdamascena on 17/09/23.
//  
//

import Foundation

class WebPresenter: ViewToPresenterWebProtocol {

    

    var view: PresenterToViewWebProtocol?
    var interactor: PresenterToInteractorWebProtocol?
    var router: PresenterToRouterWebProtocol?
    
    func loadWebPage(at url: URL) {
        view?.openWeb(on: url)
    }
}

extension WebPresenter: InteractorToPresenterWebProtocol {
    
}
