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


































protocol HomeViewControllerSpy {
    
    var shouldChangeCardPhase: Bool { get }
    var cardPhaseFake: Int { get }
}


class HomeViewControllerMock: UIViewController, HomeViewControllerSpy {
    
    var cardPhaseFake: Int = 0
    var shouldChangeCardPhase: Bool = false
    
    var presenter: ViewToPresenterHomeProtocol?
    
}


extension HomeViewControllerMock: PresenterToViewHomeProtocol {
    
    func userAllowedAccessCalendar() {
        
    }
    
    func userDeniedAccessCalendar() {
        
    }
    
    func changeSelectedCell(selectedCell: luna.CalendarCollectionViewCell) {
        
    }
    
    func moveCalendarCollection(toXAxis: CGFloat) {
        
    }
    
    func updateView(_ center: luna.CalendarCollectionViewCell) {
        
    }
    
    func load(collectionDataSource: [luna.CyclePhaseViewModel]) {
        
    }
    
    func moveTo(_ month: Date) {
        
    }
    
    func showFeedbackRegisterMenstruation() {
        
    }
    
    func changeCurrentIndexCardPhase(at newIndex: Int) {
        shouldChangeCardPhase = true
        cardPhaseFake = newIndex
    }
    
}




extension HomePresenterMock: InteractorToPresenterHomeProtocol {
    
    func accessAllowed() {
        
    }
    
    func accessDenied() {
        
    }
    
    func showFeedbackRegisterMenstruation() {
        
    }
}




