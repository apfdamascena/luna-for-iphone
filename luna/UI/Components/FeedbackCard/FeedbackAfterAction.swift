//
//  FeedbackAfterAction.swift
//  luna
//
//  Created by alexdamascena on 03/08/23.
//

import Foundation


enum FeedbackAfterAction {
    
    case recordedMenstruation
    case cycleAddedToCalendar
    
    var value: String {
        switch self {
        case .recordedMenstruation:
            return L10n.Constants.Content.Label.Home.recordedMenstruation
        case .cycleAddedToCalendar:
            return "Seu ciclo foi adicionado ao Calendário"
        }
    }
}
