//
//  HomeInteractor.swift
//  lunaTests
//
//  Created by alexdamascena on 04/09/23.
//
@testable import luna
import XCTest

class LunaCalendarManagerMock: LunaCalendarManager {
    
    private var requestAccessToCalendarCompletion: Result<CalendarAccess, CalendarAccessError>
    
    init(with completion: Result<CalendarAccess, CalendarAccessError> = .failure(.permissionDenied)) {
        self.requestAccessToCalendarCompletion = completion
    }
    
    override func requestAccessToCalendar(completion: @escaping PermissionResponse) {
        completion(requestAccessToCalendarCompletion)
    }
}



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
