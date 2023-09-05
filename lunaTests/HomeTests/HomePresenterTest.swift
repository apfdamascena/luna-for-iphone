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
        XCTAssertEqual(interactor.nextIndexCardPhase, expectedCardPhase)
        
        
        
        
        
    }
    
    func testShouldRestartCardViewWhenUserTapLastCardPhase(){
//        let (sut, view ) = makeSUT()
//        let currentCardPhase = 4
//        let expectedCardPhase = 0
//        sut.userTappedCardPhase(at: currentCardPhase)
//
//
//        XCTAssertTrue(sut.userTappedCardPhaseCalled)
//        XCTAssertTrue(view.shouldChangeCardPhase)
//        XCTAssertEqual(view.cardPhaseFake, expectedCardPhase)
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

