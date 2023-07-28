//
//  TeachRecordMenstruationRouter.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//  
//

import Foundation
import UIKit

class TeachRecordMenstruationRouter: PresenterToRouterTeachRecordMenstruationProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = TeachRecordMenstruationViewController()
        
        let presenter: ViewToPresenterTeachRecordMenstruationProtocol & InteractorToPresenterTeachRecordMenstruationProtocol = TeachRecordMenstruationPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = TeachRecordMenstruationRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TeachRecordMenstruationInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
