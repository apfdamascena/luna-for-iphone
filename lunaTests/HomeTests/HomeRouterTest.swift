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

typealias HomeRouterSut = PresenterToRouterHomeProtocol & HomeRouterSpy


extension HomeRouterTest {
    
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


class HomeViewControllerMock: UIViewController, PresenterToViewHomeProtocol {
    
    var presenter: ViewToPresenterHomeProtocol?
    
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
        return 0
        
    }
}

class HomePresenterMock: ViewToPresenterHomeProtocol {
    
    var view: luna.PresenterToViewHomeProtocol?
    var interactor: luna.PresenterToInteractorHomeProtocol?
    var router: luna.PresenterToRouterHomeProtocol?
    
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

protocol HomeRouterSpy {
    
    var isPushReferencesSheetCalled: Bool { get }
    
}


class HomeRouterMock: PresenterToRouterHomeProtocol, HomeRouterSpy {
    
    var isPushReferencesSheetCalled: Bool = false
    
    func pushReferencesSheet(on view: luna.PresenterToViewHomeProtocol) {
        isPushReferencesSheetCalled = true
        guard let controller = view as? HomeViewControllerMock else { return }
        let references = ReferencesViewController()
        controller.navigationController?.present(references, animated: true)
    }
    
    
    static func createModule() -> UIViewController {
        
        let viewController = HomeViewControllerMock()
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol =  HomePresenterMock()

        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouterMock()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractorMock()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

