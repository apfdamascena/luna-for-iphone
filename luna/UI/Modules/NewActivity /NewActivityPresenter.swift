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
    
    func userTappedContinueButton() {

        guard let pageViewController = view else { return }        
        DispatchQueue.main.async {
            self.router?.pushNewActivity(on: pageViewController)
        }
        
    }
}

extension NewActivityPresenter: InteractorToPresenterNewActivityProtocol {
    
}
