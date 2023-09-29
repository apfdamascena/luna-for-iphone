//
//  HomePresenter.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import UIKit
import EventKit

class HomePresenter: ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    init(view: PresenterToViewHomeProtocol? = nil,
         interactor: PresenterToInteractorHomeProtocol? = nil,
         router: PresenterToRouterHomeProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func checkCalendarPermission() {
        interactor?.checkIfUserGivePermission { permission in
            
            switch permission {
            case .success:
                self.view?.userAllowedAccessCalendar()
            case .failure:
                self.view?.userDeniedAccessCalendar()
            }
        }
    }
    
    func showCyclePhaseReferencesSheet() {
        guard let homePresenterView = view else { return }
        self.router?.pushReferencesSheet(on: homePresenterView)
    }
    
    func loadUserCalendar() {
        interactor?.loadPhasesToUserCalendar()
    }
    
    func loadCalendarToCollection(isloading: Bool) {
        let collectionDataSource = interactor?.loadCalendarToCollection()
        
        view?.load(collectionDataSource: collectionDataSource?.calendar ?? [])
        
        if isloading {
            self.view?.didUpdateState(.loading)
        } else {
            if collectionDataSource?.haveAccess == true {
                self.view?.didUpdateState(.autorized)
            } else {
                self.view?.didUpdateState(.unautorized)
            }
        }
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
    
    func findBestPhase(activity: ActivityMetrics) -> EKEvent {
        guard let idealPhase = interactor?.findBestPhaseFor(activity: activity) else {
            return EKEvent()
        }
        
        return idealPhase
    }

    func moveTo(_ centerCell: CalendarCollectionViewCell?) {
        guard let centerCell = centerCell else { return }
        view?.updateView(centerCell)
    }
    
    func userOpenDeviceSettings() {
        interactor?.openDeviceSettings()
    }
    
    func moveTo(_ month: Date) {
        view?.moveTo(month)
    }
    
    func userTappedCardPhase(at index: Int) {
        guard let newCardPhaseIndex = interactor?.nextIndexForCardPhase(at: index) else { return }
        view?.changeCurrentIndexCardPhase(at: newCardPhaseIndex)
    }
    
    func loadActivitiesDataSource() {
        let activityDataSource = interactor?.findActivityEventsOfCurrentMonth()
        view?.loadActivity(dataSource: activityDataSource ?? ActivityEventMonthWeek(week: [], month: []))
    }
    
    func getFirstDayLastMenstruation() -> Date? {
        return interactor?.getFirstDayOfLastMenstruation()
    }
    
    func openCalendarOnLuna(withEvent: EKEvent) {
        view?.openCalendar(with: withEvent)
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
    func accessAllowed() {
        view?.userAllowedAccessCalendar()
    }
    
    func accessDenied() {
        view?.userDeniedAccessCalendar()
    }
    
    func showFeedbackRegisterMenstruation() {
        view?.showFeedbackRegisterMenstruation()
    }
}
