//
//  CyclePhase.swift
//  luna
//
//  Created by sml on 27/07/23.
//

enum CyclePhase: String {
    case folicular
    case menstruation
    case luteal
    case fertile
    case expectedMenstruation
    case pms
    
    var value: String {
        switch self {
        case .folicular:
            return L10n.Constants.Content.Label.folicular
        case .menstruation:
            return L10n.Constants.Content.Label.menstruation
        case .luteal:
            return L10n.Constants.Content.Label.luteal
        case .fertile:
            return L10n.Constants.Content.Label.fertile
        case .expectedMenstruation:
            return L10n.Constants.Content.Label.expectedMenstruation
        case .pms:
            return L10n.Constants.Content.Label.pms
        }
    }
}
