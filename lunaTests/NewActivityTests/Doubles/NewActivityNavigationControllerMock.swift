//
//  FirstTimeNewActivityNavigationControllerMock.swift
//  lunaTests
//
//  Created by Cynara Costa on 10/10/23.
//

import UIKit

class NewActivityNavigationControllerMock: UINavigationController {
    var pushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
}
