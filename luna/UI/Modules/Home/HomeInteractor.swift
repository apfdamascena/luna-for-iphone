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
    
    var lunaCalendarManager: CalendarManager?
    var presenter: InteractorToPresenterHomeProtocol?
    
    var calendarPermission: CalendarAccess = .unauthorized
    
    init(lunaCalendarManager: CalendarManager = LunaCalendarManager()){
        self.lunaCalendarManager = lunaCalendarManager
    }
    
    func checkIfUserGivePermission(completion: @escaping PermissionResponse) {

        lunaCalendarManager?.requestAccessToCalendar{ permission in
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
              
                  
        lunaCalendarManager?.firstLoadElementsToCalendar(firstDayMenstruation: lastDayMenstruation,
                                                        averageMenstruationDuration: menstruationDuration,
                                                        averageCycleDuration: cycleDuration)
    }
    
    func loadCalendarToCollection() -> (calendar: [CyclePhaseViewModel], haveAccess: Bool){
        
        let firstDate = Date().daysBefore(HomeCollection.COLLECTION_RANGE/2)
        let finalDate = Date().daysAfter(HomeCollection.COLLECTION_RANGE/2)
        lunaCalendarManager?.transformExpectedToMenstruation()
        
        guard let events = lunaCalendarManager?.getEventsByDate(firstDate: firstDate, finalDate: finalDate) else { return ([], false) }

        let collectionViewDataSource = CalendarCollectionConverter().turnDaysIntoCyclePhase(events: events.calendar)
        return (collectionViewDataSource, events.hasAccess)
    }
    
    func insertedMenstruationToCollection(selectedDate: Date) -> Bool {
        guard let response = lunaCalendarManager?.changeDayPhaseBy(selectedDate: selectedDate) else { return false }
        
        var isRemove = false
        if response == ChangeCycleResponse.isMenstruation {
            isRemove = true
        }

        lunaCalendarManager?.adjustEventsInCalendar(selectedDate: selectedDate, isRemove: isRemove)
        if response == ChangeCycleResponse.hasMenstruationNearDate {
            return true
        }
        return true
    }
    
    
    func openDeviceSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { _ in })
        }
    }
    
    func nextIndexForCardPhase(at index: Int) -> Int {
        return (index + 1) % 5
    }
    
}
