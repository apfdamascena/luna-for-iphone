//
//  HomeRouter.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    func pushReferencesSheet(on view: PresenterToViewHomeProtocol) {
        guard let homeVC = view as? HomeViewController else { return }
        let referencesSheetVC = ReferencesViewController()
        
        if let sheet = referencesSheetVC.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [.custom { context in
                    return context.maximumDetentValue * 0.8
                }, .large()]
            } 
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        
        homeVC.present(referencesSheetVC, animated: true)
    }
    
    
    static func createModule() -> UIViewController {
        
        let viewController = HomeViewController()
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
