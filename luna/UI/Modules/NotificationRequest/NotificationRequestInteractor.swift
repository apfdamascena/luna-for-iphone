//
//  NotificationRequestInteractor.swift
//  luna
//
//  Created by alexdamascena on 25/09/23.
//

import Foundation


class NotificationRequestInterator: PresenterToInteractorNotificationRequestProtocol {
    
    private lazy var lunaCalendarManager = LunaCalendarManager()
    
    func removeAllPhaseFromCalendar() {
        lunaCalendarManager.removeLunaCalendarOnOnboarding()
    }
}
