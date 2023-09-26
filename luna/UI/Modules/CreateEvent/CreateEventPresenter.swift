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
    
    func insertActivity(title: String, initialDate: Date, finalDate: Date) {
        interactor?.insertActivityToCalendar(title: title, initialDate: initialDate, finalDate: finalDate)
    }
    
    func userTappedCreateEventButton() {
        
        guard let pageViewController = view else { return }
        DispatchQueue.main.async {
            self.router?.pushNewActivity(on: pageViewController)
        }
        
    }
}

extension CreateEventPresenter: InteractorToPresenterCreateEventProtocol {
    
}
