//
//  HomeTests.swift
//  lunaTests
//
//  Created by alexdamascena on 31/08/23.
//

import XCTest
@testable import luna


final class HomeRouterTest: XCTestCase {
    
    func testPushReferenceSheetWhenUserTap(){
        let homeVC = HomeViewControllerMock()
        let router = HomeRouter()
        router.pushReferencesSheet(on: homeVC)
        
        XCTAssertTrue(homeVC.hasBeenPresented)
        XCTAssertTrue(homeVC.presentedView is ReferencesViewController)
    }
}








