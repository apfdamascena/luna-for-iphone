//
//  LandingPageInteractor.swift
//  luna
//
//  Created by alexdamascena on 25/09/23.
//  
//

import Foundation

class LandingPageInteractor: PresenterToInteractorLandingPageProtocol {

    var presenter: InteractorToPresenterLandingPageProtocol?
    
    private let lunaCalendarManager = LunaCalendarManager()
    
    func removeAllPhasesFromCalendar() {
        print("removed 3")
        lunaCalendarManager.removeLunaCalendarOnOnboarding()
    }
}
