//
//  CreateEventInteractor.swift
//  luna
//
//  Created by sml on 20/09/23.
//  
//

import Foundation
import EventKit

class CreateEventInteractor: PresenterToInteractorCreateEventProtocol {

    var presenter: InteractorToPresenterCreateEventProtocol?
    private let activitiesCalendarManager: ActivitiesCalendarManager
    
    init(
         activitiesCalendarManager: ActivitiesCalendarManager = ActivitiesCalendarManager()
    ){
        self.activitiesCalendarManager = activitiesCalendarManager
    }
    
    func insertActivityToCalendar(title: String, initialDate: Date, finalDate: Date) {
        let activityEvent = ActivityEvent(title: title, startDate: initialDate, endDate: finalDate, event: EKEvent())
        activitiesCalendarManager.createEvent(activityEvent)
    }
}
