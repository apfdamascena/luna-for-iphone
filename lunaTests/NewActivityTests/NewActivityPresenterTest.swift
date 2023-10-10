//
//  NewActivityPresenterTest.swift
//  lunaTests
//
//  Created by Cynara Costa on 10/10/23.
//

import XCTest
@testable import luna
import EventKit

final class NewActivityPresenterTest: XCTestCase {
    func testUserTappedContinueButtonTrigger() {
        let (sut, doubles) = makeSut()
        sut.userTappedContinueButton()
        DispatchQueue.main.async {
            XCTAssertEqual(doubles.routerSpy.calledMethods, [.pushNewActivity])
        }
    }
    
    func testFindBestPhaseInteractorTrigger() {
        let (sut, doubles) = makeSut()
        let result = sut.findBestPhase(activity: activityMetricsFake)
        XCTAssertEqual(doubles.interactorSpy.calledMethods, [.findBestActivity])
    }
    
    func testFieldsWereNotFilledTrigger() {
        let (sut, doubles) = makeSut()
        sut.fieldsWereNotFilled(.metrics)
        XCTAssertEqual(doubles.viewControllerSpy.calledMethods, [.showFeedback])
    }
    
}

private extension NewActivityPresenterTest {
    typealias SutAndDoubles = (
        sut: NewActivityPresenter,
        doubles: (
            routerSpy: NewActivityRouterSpy,
            interactorSpy: NewActivityInteractorSpy,
            viewControllerSpy: NewActivityViewControllerSpy
        )
    )
    
    func makeSut() -> SutAndDoubles {
        let routerSpy = NewActivityRouterSpy()
        let interactorSpy = NewActivityInteractorSpy()
        let viewControllerSpy = NewActivityViewControllerSpy()
        let sut = NewActivityPresenter(view: viewControllerSpy, interactor: interactorSpy, router: routerSpy)
        
        return (sut, (routerSpy, interactorSpy, viewControllerSpy))
    }
}
