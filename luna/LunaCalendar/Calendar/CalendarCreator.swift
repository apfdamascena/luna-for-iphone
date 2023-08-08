//
//  CalendarCreator.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import EventKit
import UIKit

class CalendarCreator {
    
    let eventStore: EKEventStore

    init(eventStore: EKEventStore) {
        self.eventStore = eventStore
    }

    func create() -> EKCalendar? {
        let calendar = EKCalendar(for: .event, eventStore: eventStore)
        calendar.title = L10n.Constants.Content.Label.appName
        calendar.cgColor = UIColor.purple.cgColor
        guard let source = self.getSourceFromAccountOrDevice() else {
            return nil
        }
        
        calendar.source = source
        try? eventStore.saveCalendar(calendar, commit: true)
        return calendar
    }
    
    private func getSourceFromAccountOrDevice() -> EKSource? {
        let `default` = eventStore.defaultCalendarForNewEvents?.source
        let iCloud = eventStore.sources.first(where: { $0.title == L10n.Constants.Content.Api.icloud })
        let local = eventStore.sources.first(where: { $0.sourceType == .local })
        return `default` ?? iCloud ?? local
    
    }
}
