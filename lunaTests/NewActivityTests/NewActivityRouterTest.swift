//
//  NewActivityRouterTest.swift
//  lunaTests
//
//  Created by Cynara Costa on 10/10/23.
//

import XCTest
@testable import luna

final class NewActivityRouterTest: XCTestCase {
    
    func testPushNewActivityWhenUserTap() {
        let newActivityVCDummy = NewActivityViewControllerSpy()
        let newActivityNavigationMock = NewActivityNavigationControllerMock(rootViewController: newActivityVCDummy)
        let sut = NewActivityRouter()
        sut.pushNewActivity(on: newActivityVCDummy)
        
        XCTAssertTrue(newActivityNavigationMock.pushedViewController is BestActivityViewController)
    }
    
}
