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
        
        let fakeCardPhase  = 4
        let expectedCardPhase = 0
        
        presenter.userTappedCardPhase(at: fakeCardPhase)
        
        XCTAssertTrue(interactor.nextIndexForCardPhaseCalled)
        XCTAssertEqual(view.cardPhaseFake, expectedCardPhase)
    }
    
    
    func testShouldShowCyclePhaseReferencesWhenUserTap(){
        let router = HomeRouterMock()
        let presenter = HomePresenter(router: router)
        
        presenter.showCyclePhaseReferencesSheet()
        
        XCTAssertTrue(router.isPushReferencesSheetCalled)
    }
    
    func testShouldOpenPermissionsDeviceWhenUserTapSettings(){
        let interactorMock = HomeInteractorMock()
        let presenter = HomePresenter(interactor: interactorMock)
        
        presenter.userOpenDeviceSettings()
        
        XCTAssertTrue(interactorMock.openSettingsHasBeenCalled)
    }
}

