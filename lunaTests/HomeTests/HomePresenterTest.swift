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
        
        let (sut, view ) = makeSUT()
        let currentCardPhase = 0
        let expectedCardPhase = 1
        sut.userTappedCardPhase(at: currentCardPhase)
        
        XCTAssertTrue(sut.userTappedCardPhaseCalled)
        XCTAssertTrue(view.shouldChangeCardPhase)
        XCTAssertEqual(view.cardPhaseFake, expectedCardPhase)
    }
    
    func testShouldRestartCardViewWhenUserTapLastCardPhase(){
        let (sut, view ) = makeSUT()
        let currentCardPhase = 4
        let expectedCardPhase = 0
        sut.userTappedCardPhase(at: currentCardPhase)
        
        
        XCTAssertTrue(sut.userTappedCardPhaseCalled)
        XCTAssertTrue(view.shouldChangeCardPhase)
        XCTAssertEqual(view.cardPhaseFake, expectedCardPhase)
    }
}


extension HomePresenterTest {
    
    typealias HomePresenterSUT = ViewToPresenterHomeProtocol & HomePresenterSpy
    
    typealias SutAndDoubles = (
        sut: HomePresenterSUT,
        doubles: HomeViewControllerMock
    )
    
    func makeSUT() -> SutAndDoubles {
        let module = HomeRouterMock.createModule()
        let view = module as! HomeViewControllerMock
        let presenter  = view.presenter as! HomePresenterSUT
        return (presenter, view)
    }
}

protocol HomePresenterSpy {
    
    var userTappedCardPhaseCalled: Bool { get }
}


class HomePresenterMock: ViewToPresenterHomeProtocol, HomePresenterSpy {
    
    var view: luna.PresenterToViewHomeProtocol?
    var interactor: luna.PresenterToInteractorHomeProtocol?
    var router: luna.PresenterToRouterHomeProtocol?
    
    var userTappedCardPhaseCalled: Bool = false
    
    func checkCalendarPermission() {
    }
    
    func loadUserCalendar() {
        
    }
    
    func loadCalendarToCollection() {
        
    }
    
    func insertMenstruation(selectedDate: Date) -> Bool {
        return false
    }
    
    func userSelect(_ cell: luna.CalendarCollectionViewCell?, center: luna.CalendarCollectionViewCell?, andMoveCenter: CGFloat?) {
        
    }
    
    func moveTo(_ centerCell: luna.CalendarCollectionViewCell?) {
        
    }
    
    func moveTo(_ month: Date) {
        
    }
    
    func userOpenDeviceSettings() {
        
    }
    
    func showCyclePhaseReferencesSheet() {
        
    }
    
    func userTappedCardPhase(at index: Int) {
        userTappedCardPhaseCalled = true
        guard let newCardPhaseIndex = interactor?.nextIndexForCardPhase(at: index) else { return }
        view?.changeCurrentIndexCardPhase(at: newCardPhaseIndex)
    }
}


class HomeInteractorMock: PresenterToInteractorHomeProtocol {
    
    var presenter: luna.InteractorToPresenterHomeProtocol?
    
    func checkIfUserGivePermission(completion: @escaping luna.PermissionResponse) {
        
    }
    
    func loadPhasesToUserCalendar() {
        
    }
    
    func loadCalendarToCollection() -> [luna.CyclePhaseViewModel] {
        return []
    }
    
    func insertedMenstruationToCollection(selectedDate: Date) -> Bool {
        return false
        
    }
    
    func openDeviceSettings() {
        
    }
    
    func nextIndexForCardPhase(at index: Int) -> Int {
        return (index + 1) % 5
    }
}

