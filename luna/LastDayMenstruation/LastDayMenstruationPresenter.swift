//
//  LastDayMenstruationPresenter.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//  
//

import Foundation

class LastDayMenstruationPresenter: ViewToPresenterLastDayMenstruationProtocol {

    var view: PresenterToViewLastDayMenstruationProtocol?
    var router: PresenterToRouterLastDayMenstruationProtocol?
    
    func userTappedContinue() {
        guard let lastDayMenstruationView = view else { return }
        
        DispatchQueue.main.async {
            self.router?.pushMenstruationDuration(on: lastDayMenstruationView)
        }
        
    }
}
