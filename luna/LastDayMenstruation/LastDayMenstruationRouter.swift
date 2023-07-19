//
//  LastDayMenstruationRouter.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//  
//

import Foundation
import UIKit

class LastDayMenstruationRouter: PresenterToRouterLastDayMenstruationProtocol {

    static func createModule() -> UIViewController {
        
        let viewController = LastDayMenstruationViewController()
        
        let presenter: ViewToPresenterLastDayMenstruationProtocol = LastDayMenstruationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LastDayMenstruationRouter()
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func pushMenstruationDuration(on view: PresenterToViewLastDayMenstruationProtocol) {
        let menstruationDuration = MenstruationDurationRouter.createModule()
        
        guard let lastDayMenstruation = view as? LastDayMenstruationViewController else { return }
        lastDayMenstruation.navigationController?.pushViewController(menstruationDuration, animated: true)
    }
    
}
