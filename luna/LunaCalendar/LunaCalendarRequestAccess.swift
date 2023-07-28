//
//  LunaCalendarRequestAcces.swift
//  luna
//
//  Created by sml on 27/07/23.
//

import EventKit

class LunaCalendarRequestAccess {
    func requestAccessToCalendar() {
        EKEventStore().requestAccess(to: .event) {_, _ in
        }
    }
}
