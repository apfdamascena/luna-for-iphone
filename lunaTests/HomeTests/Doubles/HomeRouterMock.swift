//
//  HomeRouterMock.swift
//  lunaTests
//
//  Created by alexdamascena on 31/08/23.
//

import Foundation
@testable import luna
import UIKit


class HomeRouterMock: HomeRouter, HomeRouterSpy {

    var isPushReferencesSheetCalled: Bool = false
    
    override func pushReferencesSheet(on view: luna.PresenterToViewHomeProtocol) {
        isPushReferencesSheetCalled = true
        super.pushReferencesSheet(on: view)
    }
    
}
