//
//  HomePresenter.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {

    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func checkCalendarPermission() {
        interactor?.checkIfUserGivePermission{ permission in
            
            switch permission {
            case .success:
                self.view?.userAllowedAccessCalendar()
            case .failure:
                self.view?.userDeniedAccessCalendar()
            }
            
        }
    }
    
    func loadUserCalendar() {
        interactor?.loadPhasesToUserCalendar()
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
    func accessAllowed() {
        view?.userAllowedAccessCalendar()
    }
    
    func accessDenied() {
        view?.userDeniedAccessCalendar()
    }
}
