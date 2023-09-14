//
//  FirstTimeNewActivityPresenterTest.swift
//  lunaTests
//
//  Created by Cynara Costa on 13/09/23.
//

import XCTest
@testable import luna

final class FirstTimeNewActivityPresenterTest: XCTestCase {
    
    func testUserTappedLetsGoButtonTrigger() {
        let (sut, doubles) = makeSut()

        sut.userTappedLetsGoButton()
        DispatchQueue.main.async {
            XCTAssertEqual(doubles.routerSpy.calledMethods, [.pushNewActivity])
        }
    }
    
}

private extension FirstTimeNewActivityPresenterTest {
    typealias SutAndDoubles = (
        sut: FirstTimeNewActivityPresenter,
        doubles: (
            routerSpy: FirstTimeNewActivityRouterSpy,
            viewControllerDummy: FirstTimeNewActivityViewControllerMock
        )
    )
    
    func makeSut() -> SutAndDoubles {
        let routerSpy = FirstTimeNewActivityRouterSpy()
        let viewControllerDummy = FirstTimeNewActivityViewControllerMock()
        let sut = FirstTimeNewActivityPresenter(view: viewControllerDummy, router: routerSpy)
        
        return (sut, (routerSpy, viewControllerDummy))
    }
}
