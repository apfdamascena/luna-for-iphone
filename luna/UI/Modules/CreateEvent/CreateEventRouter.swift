//
//  CreateEventRouter.swift
//  luna
//
//  Created by sml on 20/09/23.
//  
//

import Foundation
import UIKit

class CreateEventRouter: PresenterToRouterCreateEventProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = CreateEventViewController()
        
        let presenter: ViewToPresenterCreateEventProtocol & InteractorToPresenterCreateEventProtocol = CreateEventPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CreateEventRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CreateEventInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushNewActivity(on view: PresenterToViewCreateEventProtocol) {
        let activityOnCalendar = ActivityOnCalendarRouter.createModule()
        
        guard let createEventController = view as? CreateEventViewController else { return }
        createEventController.navigationController?.pushViewController(activityOnCalendar, animated: true)
    }
    
}
