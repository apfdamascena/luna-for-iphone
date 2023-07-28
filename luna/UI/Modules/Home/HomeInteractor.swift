//
//  HomeInteractor.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation

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
        if calendarPermission == .unauthorized { return }
        
        guard let lastDayMenstruation = OnboardingUserCycleInformation.shared.lastMenstruation,
              let menstruationDuration = OnboardingUserCycleInformation.shared.menstruationDuration,
              let cycleDuration = OnboardingUserCycleInformation.shared.cycleDuration else { return }
              
                  
        lunaCalendarManager.firstLoadElementsToCalendar(firstDayMenstruation: lastDayMenstruation,
                                                        averageMenstruationDuration: menstruationDuration,
                                                        averageCycleDuration: cycleDuration)
    }
}
