//
//  FirstTimeNewActivityRouterMock.swift
//  lunaTests
//
//  Created by Cynara Costa on 13/09/23.
//

@testable import luna
import UIKit

class FirstTimeNewActivityRouterSpy: FirstTimeNewActivityRouter {
    enum Methods: Equatable {
        case pushNewActivity
    }
    
    private(set) var calledMethods = [Methods]()
    
    override func pushNewActivity(on view: PresenterToViewFirstTimeNewActivityProtocol) {
        calledMethods.append(.pushNewActivity)
    }
    
}
