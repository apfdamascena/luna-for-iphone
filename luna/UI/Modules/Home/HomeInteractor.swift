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
        
        let lastDayMenstruation = UserCycleInformation.shared.lastMenstruation
        let menstruationDuration = UserCycleInformation.shared.menstruationDuration
        let cycleDuration = UserCycleInformation.shared.cycleDuration
              
                  
        lunaCalendarManager.firstLoadElementsToCalendar(firstDayMenstruation: lastDayMenstruation,
                                                        averageMenstruationDuration: menstruationDuration,
                                                        averageCycleDuration: cycleDuration)
    }
    
    func loadCalendarToCollection() -> [CyclePhaseViewModel] {
        
        let firstDate = Date().daysBefore(HomeCollection.COLLECTION_RANGE/2)
        let finalDate = Date().daysAfter(HomeCollection.COLLECTION_RANGE/2)
        lunaCalendarManager.transformExpectedToMenstruation()

        let events = lunaCalendarManager.getEventsByDate(firstDate: firstDate, finalDate: finalDate)

        let collectionViewDataSource = CalendarCollectionConverter().turnDaysIntoCyclePhase(events: events)
        return collectionViewDataSource
    }
    
    func insertedMenstruationToCollection(selectedDate: Date) -> Bool {
        let response = lunaCalendarManager.changeCycleBy(selectedDate: selectedDate)
        if response == ChangeCycleResponse.hasMenstruationNearDate {
            return true
        }
        return false
    }
    
    
    func openDeviceSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { _ in })
        }
    }
}
