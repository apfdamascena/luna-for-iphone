//
//  HomePresenter.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import UIKit

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
    
    func loadCalendarToCollection() {
        let collectionDataSource = interactor?.loadCalendarToCollection()
        view?.teste(collectionDataSource: collectionDataSource ?? [])
    }
    
    func userSelect(_ cell: CalendarCollectionViewCell?,
                    center centerCell: CalendarCollectionViewCell?,
                    andMoveCenter centerXtoCollection: CGFloat?) {
        
        guard let selectedCell = cell,
              let centerCell = centerCell,
              let centerXtoCollection = centerXtoCollection else { return }
        
        if centerCell == selectedCell {
            view?.changeSelectedCell(selectedCell: selectedCell)
        } else {
            view?.moveCalendarCollection(toXAxis: centerXtoCollection)
        }
    }
    
    func insertMenstruation(selectedDate: Date) -> Bool {
        guard let insertedMenstruation = interactor?.insertedMenstruationToCollection(selectedDate: selectedDate) else { return false }
        return insertedMenstruation
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
