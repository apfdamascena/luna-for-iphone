//
//  LunaCalendarRequestAcces.swift
//  luna
//
//  Created by sml on 27/07/23.
//

import EventKit

class LunaCalendarRequestAccess {
    
    let eventStore = EKEventStore()
    
    func askForPermission() {
        eventStore.requestAccess(to: .event) { success, error in
            guard error == nil, success else { return }
        }
    }
}
