//
//  LandingPagePresenter.swift
//  luna
//
//  Created by gabrielfelipo on 21/07/23.
//
//

import Foundation

class LandingPagePresenter: ViewToPresenterLandingPageProtocol {

    var interactor: PresenterToInteractorLandingPageProtocol?
    var view: PresenterToViewLandingPageProtocol?
    var router: PresenterToRouterLandingPageProtocol?
    
    func userTappedContinue() {
        guard let landingPageView = view else { return }
        
        DispatchQueue.main.async {
            self.router?.pushLastDayMenstruation(on: landingPageView)
        }
    }
    
    func removeLunaCalendar() {
        interactor?.removeAllPhasesFromCalendar()
    }
}

