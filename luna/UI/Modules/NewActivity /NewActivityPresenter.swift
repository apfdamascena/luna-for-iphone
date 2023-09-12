//
//  NewActivityPresenter.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import UIKit

class NewActivityPresenter: ViewToPresenterNewActivityProtocol {

    var view: PresenterToViewNewActivityProtocol?
    var interactor: PresenterToInteractorNewActivityProtocol?
    var router: PresenterToRouterNewActivityProtocol?
    
    func userTappedLetsGoButton() {
//        guard let pageViewController = view else { return }
        let page = NewActivityView()
        ActivityManager.shared.userSawActivities()
        
        DispatchQueue.main.async {
//            self.router?.pushNewActivity(on: pageViewController)
        }
        
    }
    
}

extension NewActivityPresenter: InteractorToPresenterNewActivityProtocol {
    
}
