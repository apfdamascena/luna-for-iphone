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
    
    override func nextIndexForCardPhase(at index: Int) -> Int {
        nextIndexForCardPhaseCalled = true
        return super.nextIndexForCardPhase(at: index)
    }
    
    override func openDeviceSettings() {
        openSettingsHasBeenCalled = true
        super.openDeviceSettings()
    }
}
