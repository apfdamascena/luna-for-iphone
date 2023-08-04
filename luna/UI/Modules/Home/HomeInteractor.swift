//
//  HomeInteractor.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import UIKit

class HomeInteractor: PresenterToInteractorHomeProtocol {

    var presenter: InteractorToPresenterHomeProtocol?
    private let lunaCalendarManager = LunaCalendarManager()
    
    private var calendarPermission: CalendarAccess = .unauthorized
    
    func checkIfUserGivePermission(completion: @escaping PermissionResponse) {

        lunaCalendarManager.requestAccessToCalendar{ permission in
            switch permission {
            case .success:
                self.calendarPermission = .authorized
            case .failure:
                self.calendarPermission = .unauthorized
            }
            
            completion(permission)
        }
    }
    
    func loadPhasesToUserCalendar() {
        
        let lastDayMenstruation = OnboardingUserCycleInformation.shared.lastMenstruation
        let menstruationDuration = OnboardingUserCycleInformation.shared.menstruationDuration
        let cycleDuration = OnboardingUserCycleInformation.shared.cycleDuration
              
                  
        lunaCalendarManager.firstLoadElementsToCalendar(firstDayMenstruation: lastDayMenstruation,
                                                        averageMenstruationDuration: menstruationDuration,
                                                        averageCycleDuration: cycleDuration)
    }
    
    func openDeviceSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { _ in })
        }
    }
}
