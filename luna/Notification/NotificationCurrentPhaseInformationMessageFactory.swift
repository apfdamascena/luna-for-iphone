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
        NotificationBody(title: "É literalmente uma fase!", body: "Hoje tá sendo uma mistura de sentimentos, né? Entenda mais sobre essa fase 👉"),
    ]
    
    private let expectedMenstruationPhase = [
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title1,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body1),
        NotificationBody(title: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.title2,
                         body: L10n.Constants.Content.Notification.Dataset.ExpectedMenstruation.body3),
    ]

    private let folicularPhase =  [
        NotificationBody(title: "Se arruma e vamos! 🏃‍♀️",
                         body: "Você pode sentir mais energia hoje, abuse dos treinos de força. Saiba mais"),
        NotificationBody(title: "GRAVE: chegou sua hora 🚨",
                         body: "Hora de beber água, meu bem. Vamos lá, hidrate-se e seu corpo agradece!"),
        NotificationBody(title: "Energia em alta!",
                         body: "Você pode ter mais disposição hoje! Que tal realizar as pendências da semana?")
    ]
    
    private let lutealPhase = [
        NotificationBody(title: "Hormônios em alta!",
                         body: "Os níveis de estrogênio e progesterona atingem o pico nessa fase. Saiba como isso pode interferir na sua rotina 👉"),
        NotificationBody(title: "Mó paz ✌️",
                         body: "É um bom momento para fazer atividades tranquilas. Saiba mais sobre essa fase!"),
        NotificationBody(title: "8 ou 80?",
                         body: "Seu humor pode variar hoje, é bom evitar grandes mudanças, hein? Saiba mais 👉")]
    
    private let pmsPhase = [
        NotificationBody(title: "Dica do dia ✨",
                         body: "Seu corpo pode estar retendo mais líquido. Evitar excesso de alimentos ricos em sal pode ajudar. "),
        NotificationBody(title: "Forças!",
                         body: "Você pode sentir cólica e outras dores no corpo nessa fase. Veja o que mais pode acontecer 👉"),
        NotificationBody(title: "É literalmente uma fase!",
                         body: "Hoje tá sendo uma mistura de sentimentos, né? Entenda mais sobre essa fase 👉")]
    
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
            return NotificationBody(title: "Dor Dor, inchaço!!", body: "Fase menstrual. Registre em Luna!")
        default:
            return NotificationBody(title: "", body: "")
        }
    }
}
