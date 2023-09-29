//
//  HomeInteractor.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import UIKit
import EventKit

class HomeInteractor: PresenterToInteractorHomeProtocol {

    var presenter: InteractorToPresenterHomeProtocol?
    
    private let activitiesCalendarManager: ActivitiesCalendarManager
    var lunaCalendarManager: CalendarManager?

    var calendarPermission: CalendarAccess = .unauthorized
    
    init(lunaCalendarManager: CalendarManager = LunaCalendarManager(),
         activitiesCalendarManager: ActivitiesCalendarManager = ActivitiesCalendarManager()
    ){
        self.lunaCalendarManager = lunaCalendarManager
        self.activitiesCalendarManager = activitiesCalendarManager
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
        if response == ChangeCycleResponse.passedElevenDays {
            return false
        }
        return true
    }

    func insertActivityToCalendar(title: String, initialDate: Date, finalDate: Date) {
        let activityEvent = ActivityEvent(title: title, startDate: initialDate, endDate: finalDate, event: EKEvent())
        activitiesCalendarManager.createEvent(activityEvent)
    }
    
    func findBestPhaseFor(activity: ActivityMetrics) -> EKEvent? {
        guard var phaseEvents = lunaCalendarManager?.getEventsByDate(firstDate: Date(), finalDate: activity.finalDate).calendar else { return nil }

        
        if phaseEvents.count > 5 {
            phaseEvents = Array(phaseEvents[0...4])
        }
        
        var eventAndPoint: (phaseEvent: EKEvent?,effortPoints: Int) = (nil, 100)
        
        for phaseEvent in phaseEvents {
            let checkResponse = checkViablePhaseFor(activity: activity, phaseTitle: phaseEvent.title)
            
            if checkResponse.isViable {
                return phaseEvent
            } else {
                if eventAndPoint.effortPoints > checkResponse.effortPoints {
                    eventAndPoint.phaseEvent = phaseEvent
                    eventAndPoint.effortPoints = checkResponse.effortPoints
                }
            }
        }
        
        return eventAndPoint.phaseEvent
    }
    
    func checkViablePhaseFor(activity: ActivityMetrics, phaseTitle: String) -> (isViable: Bool, effortPoints: Int) {
        var effortPoints: Int
        
        switch phaseTitle {
        case L10n.Constants.Content.Label.folicular:
            return (true,0)
            
        case L10n.Constants.Content.Label.luteal:
            if activity.stress <= 3 && activity.sociability <= 3 && activity.fisicalEffort <= 4 {
                return (true,0)
            }
            effortPoints = activity.stress + activity.fisicalEffort + activity.sociability - 10
            return (false, effortPoints)
            
        case L10n.Constants.Content.Label.fertile:
            if activity.stress <= 3 && activity.sociability <= 5 && activity.fisicalEffort <= 5 {
                return (true,0)
            }
            effortPoints = activity.stress + activity.fisicalEffort + activity.sociability - 13
            return (false, effortPoints)
            
        case L10n.Constants.Content.Label.expectedMenstruation:
            if activity.stress <= 2 && activity.sociability <= 2 && activity.fisicalEffort <= 3 {
                return (true,0)
            }
            effortPoints = activity.stress + activity.fisicalEffort + activity.sociability - 7
            return (false, effortPoints)
            
        case L10n.Constants.Content.Label.pms:
            if activity.stress <= 1 && activity.sociability <= 2 && activity.fisicalEffort <= 3 {
                return (true,0)
            }
            effortPoints = activity.stress + activity.fisicalEffort + activity.sociability - 6
            return (false, effortPoints)
            
        default:
            return (false,1000)
        }
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
    
    func findActivityEventsOfCurrentMonth() -> ActivityEventMonthWeek {
        let activitiesMonth = activitiesCalendarManager.getMonthEventsStartingToday()
        let activitiesWeek = activitiesCalendarManager.getWeekEventsStartingToday()

        return ActivityEventMonthWeek(week: activitiesWeek, month: activitiesMonth)
    }
    
    func getFirstDayOfLastMenstruation() -> Date? {
        let eventsBeforeToday = lunaCalendarManager?.getEventsByDate(firstDate: Date().daysBefore(100), finalDate: Date()).calendar
        
        let menstruationEvents = eventsBeforeToday?.filter{event in
            event.title == CyclePhase.menstruation.value
        }
        
        guard let menstruationEvent = menstruationEvents?.last else {
            return nil
        }
        
        return menstruationEvent.startDate
    }
    
        
}

