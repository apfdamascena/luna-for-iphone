//
//  HomeInteractor.swift
//  lunaTests
//
//  Created by alexdamascena on 04/09/23.
//
import XCTest
@testable import luna

final class HomeInteractorTest: XCTestCase {

    func testCheckIfUserGavePermission() throws {
        let calendarMock = LunaCalendarManagerMock(with: .success(.authorized))
        let interactor = HomeInteractor(lunaCalendarManager: calendarMock)
        
        interactor.checkIfUserGivePermission { _ in }
        
        XCTAssertEqual(interactor.calendarPermission, .authorized)
    }
    
    func testCheckIfUserDidntGivePermission() throws {
        let calendarMock = LunaCalendarManagerMock(with: .failure(.permissionDenied))
        let interactor = HomeInteractor(lunaCalendarManager: calendarMock)
        
        interactor.checkIfUserGivePermission{ _ in }
        
        XCTAssertEqual(interactor.calendarPermission, .unauthorized)
    }
}
