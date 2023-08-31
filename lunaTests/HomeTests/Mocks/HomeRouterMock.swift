//
//  HomeRouterMock.swift
//  lunaTests
//
//  Created by alexdamascena on 31/08/23.
//

import Foundation
@testable import luna
import UIKit


class HomeRouterMock: PresenterToRouterHomeProtocol, HomeRouterSpy {
    
    var isPushReferencesSheetCalled: Bool = false
    
    func pushReferencesSheet(on view: luna.PresenterToViewHomeProtocol) {
        isPushReferencesSheetCalled = true
        guard let controller = view as? HomeViewControllerMock else { return }
        let references = ReferencesViewController()
        controller.navigationController?.present(references, animated: true)
    }
    
    
    static func createModule() -> UIViewController {
        
        let viewController = HomeViewControllerMock()
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol =  HomePresenterMock()

        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouterMock()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractorMock()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
