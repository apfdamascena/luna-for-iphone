//
//  HomeViewControllerMock.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

@testable import luna
import UIKit


class HomeViewControllerMock: UIViewController, HomeViewControllerSpy {
    
    var cardPhaseFake: Int = 0
    var shouldChangeCardPhase: Bool = false
    
    var presenter: ViewToPresenterHomeProtocol?
}


extension HomeViewControllerMock: PresenterToViewHomeProtocol {
    
    func userAllowedAccessCalendar() {
        
    }
    
    func userDeniedAccessCalendar() {
        
    }
    
    func changeSelectedCell(selectedCell: luna.CalendarCollectionViewCell) {
        
    }
    
    func moveCalendarCollection(toXAxis: CGFloat) {
        
    }
    
    func updateView(_ center: luna.CalendarCollectionViewCell) {
        
    }
    
    func load(collectionDataSource: [luna.CyclePhaseViewModel]) {
        
    }
    
    func moveTo(_ month: Date) {
        
    }
    
    func showFeedbackRegisterMenstruation() {
        
    }
    
    func changeCurrentIndexCardPhase(at newIndex: Int) {
        shouldChangeCardPhase = true
        cardPhaseFake = newIndex
    }
    
}
