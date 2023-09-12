//
//  FirstTimeNewActivityPresenter.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//  
//

import Foundation

class FirstTimeNewActivityPresenter: ViewToPresenterFirstTimeNewActivityProtocol {
    var view: PresenterToViewFirstTimeNewActivityProtocol?
    var router: PresenterToRouterFirstTimeNewActivityProtocol?
    
    func userTappedLetsGoButton() {
        guard let pageViewController = view else { return }
        ActivityManager.shared.userSawActivities()
        
        DispatchQueue.main.async {
            self.router?.pushNewActivity(on: pageViewController)
        }
        
    }
    
}
