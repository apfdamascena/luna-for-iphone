//
//  HomePresenterMock.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

@testable import luna
import UIKit


class HomePresenterMock: ViewToPresenterHomeProtocol, HomePresenterSpy {
    
    var view: luna.PresenterToViewHomeProtocol?
    var interactor: luna.PresenterToInteractorHomeProtocol?
    var router: luna.PresenterToRouterHomeProtocol?
    
    var userTappedCardPhaseCalled: Bool = false
    
    
    func checkCalendarPermission() {
        
    }
    
    func loadUserCalendar() {
        
    }
    
    func loadCalendarToCollection() {
        
    }
    
    func insertMenstruation(selectedDate: Date) -> Bool {
        return false
    }
    
    func userSelect(_ cell: luna.CalendarCollectionViewCell?, center: luna.CalendarCollectionViewCell?, andMoveCenter: CGFloat?) {
        
    }
    
    func moveTo(_ centerCell: luna.CalendarCollectionViewCell?) {
        
    }
    
    func moveTo(_ month: Date) {
        
    }
    
    func userOpenDeviceSettings() {
        
    }
    
    func showCyclePhaseReferencesSheet() {
        
    }
    
    func userTappedCardPhase(at index: Int) {
        userTappedCardPhaseCalled = true
        guard let newCardPhaseIndex = interactor?.nextIndexForCardPhase(at: index) else { return }
        view?.changeCurrentIndexCardPhase(at: newCardPhaseIndex)
    }
}

extension HomePresenterMock: InteractorToPresenterHomeProtocol {
    
    func accessAllowed() {
    }
    
    func accessDenied() {
    }
    
    func showFeedbackRegisterMenstruation() {
        
    }
}
