//
//  CalendarTitle.swift
//  luna
//
//  Created by gabrielfelipo on 04/09/23.
//

import UIKit

enum CalendarTitle {
    case appName
    case appActivities
    
    var title: String {
        switch self {
        case .appName:
            return L10n.Constants.Content.Label.appName
        case .appActivities:
            return L10n.Constants.Content.Label.calendarActivities
        }
    }
}
