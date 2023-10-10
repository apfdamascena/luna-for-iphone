//
//  HomeInteractorMock.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

@testable import luna
import UIKit


class HomeInteractorMock: HomeInteractor, HomeInteractorSpy  {
    
    var openSettingsHasBeenCalled: Bool = false
    var nextIndexForCardPhaseCalled: Bool = false
    var loadUserCalendarHasBeenCalled: Bool = false
    var loadCalendarToCollectionHasBeenCalled: Bool = false
    
    override func nextIndexForRightSideCardPhase(at index: Int) -> Int {
        nextIndexForCardPhaseCalled = true
        return super.nextIndexForRightSideCardPhase(at: index)
    }
    
    override func openDeviceSettings() {
        openSettingsHasBeenCalled = true
        super.openDeviceSettings()
    }
    
    override func loadPhasesToUserCalendar() {
        loadUserCalendarHasBeenCalled = true
        super.loadPhasesToUserCalendar()
    }
    
//    override func loadCalendarToCollection() -> [CyclePhaseViewModel] {
//        loadCalendarToCollectionHasBeenCalled = true
//        return super.loadCalendarToCollection()
//    }
    
}
