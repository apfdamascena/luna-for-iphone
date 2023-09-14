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
    
    init(
        view: PresenterToViewFirstTimeNewActivityProtocol? = nil,
        router: PresenterToRouterFirstTimeNewActivityProtocol? = nil
    ) {
        self.view = view
        self.router = router
    }
    
    func userTappedLetsGoButton() {
        guard let pageViewController = view else { return }
        ActivityManager.shared.userSawActivities()
        
        DispatchQueue.main.async {
            self.router?.pushNewActivity(on: pageViewController)
        }
        
    }
    
}
