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
        let (sut, view) = makeSUT()
        sut.pushReferencesSheet(on: view)
        XCTAssertTrue(sut.isPushReferencesSheetCalled)
        XCTAssertTrue(view.navigationController?.presentedViewController is ReferencesViewController?)
    }
}


extension HomeRouterTest {
    
    typealias HomeRouterSut = PresenterToRouterHomeProtocol & HomeRouterSpy
    
    typealias SutAndDoubles = (
        sut: HomeRouterSut,
        doubles: HomeViewControllerMock
    )
    
    func makeSUT() -> SutAndDoubles {
        let module = HomeRouterMock.createModule()
        let view = module as! HomeViewControllerMock
        let router = view.presenter?.router as! HomeRouterMock
        return (router, view)
    }
}







