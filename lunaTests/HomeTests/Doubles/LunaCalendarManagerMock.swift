//
//  LunaCalendarManagerMock.swift
//  lunaTests
//
//  Created by alexdamascena on 06/09/23.
//

import Foundation
@testable import luna

class LunaCalendarManagerMock: LunaCalendarManager {
    
    private var requestAccessToCalendarCompletion: Result<CalendarAccess, CalendarAccessError>
    
    init(with completion: Result<CalendarAccess, CalendarAccessError> = .failure(.permissionDenied)) {
        self.requestAccessToCalendarCompletion = completion
    }
    
    override func requestAccessToCalendar(completion: @escaping PermissionResponse) {
        completion(requestAccessToCalendarCompletion)
    }
}
