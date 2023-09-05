//
//  HomePresenterTest.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

import XCTest
@testable import luna

final class HomePresenterTest: XCTestCase {
    
    func testShouldMoveCardWhenUserTappedCardPhase(){
        
        let view = HomeViewControllerMock()
        let router = HomeRouterMock()
        let interactor = HomeInteractorMock()
        
        let presenter = HomePresenter(view: view,
                                      interactor: interactor,
                                      router: router)
        
        let fakeCard = 0
        let expectedCardPhase = 1
        
        presenter.userTappedCardPhase(at: fakeCard)
        
        XCTAssertTrue(interactor.nextIndexForCardPhaseCalled)
        XCTAssertEqual(view.cardPhaseFake, expectedCardPhase)
        
    }
    
    func testShouldRestartCardViewWhenUserTapLastCardPhase(){
        
        let view = HomeViewControllerMock()
        let router = HomeRouterMock()
        let interactor = HomeInteractorMock()
        
        let presenter = HomePresenter(view: view,
                                      interactor: interactor,
                                      router: router)
        
        let fakeCard = 4
        let expectedCardPhase = 0
        
        presenter.userTappedCardPhase(at: fakeCard)
        
        XCTAssertTrue(interactor.nextIndexForCardPhaseCalled)
        XCTAssertEqual(view.cardPhaseFake, expectedCardPhase)
    }
}


//extension HomePresenterTest {
//
//    typealias HomePresenterSUT = ViewToPresenterHomeProtocol & HomePresenterSpy
//
//    typealias SutAndDoubles = (
//        sut: HomePresenterSUT,
//        doubles: HomeViewControllerMock
//    )
//
//    func makeSUT() -> SutAndDoubles {
//        let module = HomeRouterMock.createModule()
//        let view = module as! HomeViewControllerMock
//        let presenter  = view.presenter as! HomePresenterSUT
//        return (presenter, view)
//    }
//}

