//
//  HomeViewControllerMock.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

@testable import luna
import UIKit


class HomeViewControllerMock: HomeViewController, HomeViewControllerSpy {
    
    var hasBeenPresented = false
    var presentedView: UIViewController?
    var cardPhaseFake: Int = 0
    var shouldChangeCardPhase: Bool = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        hasBeenPresented = true
        presentedView = viewControllerToPresent
    }
}
extension HomeViewControllerMock {
    
    override func changeCurrentIndexCardPhase(at newIndex: Int) {
        shouldChangeCardPhase = true
        cardPhaseFake = newIndex
    }
}
