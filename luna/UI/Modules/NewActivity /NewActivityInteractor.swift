//
//  NewActivityInteractor.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import Foundation
import EventKit

class NewActivityInteractor: PresenterToInteractorNewActivityProtocol {

    var presenter: InteractorToPresenterNewActivityProtocol?
    var lunaCalendarManager: CalendarManager?
    
    init(lunaCalendarManager: CalendarManager = LunaCalendarManager()){
        self.lunaCalendarManager = lunaCalendarManager
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
    
}
