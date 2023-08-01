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
    
    func userSelect(_ cell: CalendarCollectionViewCell?,
                    center centerCell: CalendarCollectionViewCell?,
                    andMoveCenter centerXtoCollection: CGFloat?) {
        
        guard let selectedCell = cell,
              let centerCell = centerCell,
              let centerXtoCollection = centerXtoCollection else { return }
        
        if centerCell == selectedCell {
            view?.changeSelectedCell()
        } else {
            view?.moveCalendarCollection(toXAxis: centerXtoCollection)
        }
    }
    
    func change(_ centerCell: CalendarCollectionViewCell?) {
        guard let centerCell = centerCell else { return }
        view?.updateView(centerCell)
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
