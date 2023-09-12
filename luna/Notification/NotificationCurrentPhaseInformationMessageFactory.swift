//
//  NotificationCurrentPhaseInformationMessageFactory.swift
//  luna
//
//  Created by alexdamascena on 02/09/23.
//

import Foundation

class NotificationCurrentPhaseInformationMessageFactory {
    
    static let shared = NotificationCurrentPhaseInformationMessageFactory()
    
    private var fertile = 0
    private var folicular = 0
    private var luteal = 0
    private var pms = 0
    
    private let fertilePhase = [
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title1,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body1),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title2,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body2),
    ]
    
    private let expectedMenstruationPhase = [
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title1,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body1),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title2,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body2),
    ]

    private let folicularPhase =  [
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Folicular.title,
                         body: L10n.Constants.Content.Notification.Dataset.Folicular.body),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Folicular.title1,
                         body: L10n.Constants.Content.Notification.Dataset.Folicular.body1),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Folicular.title2,
                         body: L10n.Constants.Content.Notification.Dataset.Folicular.body2),
    ]
    
    private let lutealPhase = [
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Luteal.title,
                         body: L10n.Constants.Content.Notification.Dataset.Luteal.body),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Luteal.title1,
                         body: L10n.Constants.Content.Notification.Dataset.Luteal.body1),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Luteal.title2,
                         body: L10n.Constants.Content.Notification.Dataset.Luteal.body2)
    
    ]
    
    private let pmsPhase = [
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Pms.title,
                         body: L10n.Constants.Content.Notification.Dataset.Pms.body),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Pms.title1,
                         body: L10n.Constants.Content.Notification.Dataset.Pms.body1),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.Pms.title2,
                         body: L10n.Constants.Content.Notification.Dataset.Pms.body2)
    
    ]
    
    private init(){}
    
    func create(for phase: CyclePhase) -> NotificationBody {
        switch phase {
        case .fertile:
            let message = fertilePhase[fertile]
            fertile = (fertile + 1) % fertilePhase.count
            return message
        case .folicular:
            let message = folicularPhase[folicular]
            folicular = (folicular + 1) % folicularPhase.count
            return message
        case .luteal:
            let message = lutealPhase[luteal]
            luteal = (luteal + 1) % lutealPhase.count
            return message
        
        case .pms:
            let message = pmsPhase[pms]
            pms = (pms + 1) % pmsPhase.count
            return message

        case .expectedMenstruation:
            return NotificationBody(title: "Dor Dor, inchaço!!",
                                    body: "Fase menstrual. Registre em Luna!")
        default:
            return NotificationBody(title: "", body: "")
        }
    }
}
