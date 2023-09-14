//
//  FirstTimeNewActivityNavigationControllerMock.swift
//  lunaTests
//
//  Created by Cynara Costa on 13/09/23.
//

import UIKit

class FirstTimeNewActivityNavigationControllerMock: UINavigationController {
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
