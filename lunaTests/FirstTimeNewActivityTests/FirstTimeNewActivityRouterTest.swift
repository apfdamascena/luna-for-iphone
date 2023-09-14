//
//  FirstTimeNewActivityRouterTest.swift
//  lunaTests
//
//  Created by Cynara Costa on 13/09/23.
//

import XCTest
@testable import luna

final class FirstTimeNewActivityRouterTest: XCTestCase {

    func testPushNewActivityViewWhenUserTap() {
        let firstTimeNewActivityVCDummy = FirstTimeNewActivityViewControllerMock()
        let firstTimeNewActivityNavigationMock = FirstTimeNewActivityNavigationControllerMock(rootViewController: firstTimeNewActivityVCDummy)
        
        let sut = FirstTimeNewActivityRouter()
        sut.pushNewActivity(on: firstTimeNewActivityVCDummy)

        XCTAssertTrue(firstTimeNewActivityNavigationMock.pushedViewController is NewActivityViewController)
    }
    
}


