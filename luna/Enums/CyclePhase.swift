//
//  CyclePhase.swift
//  luna
//
//  Created by sml on 27/07/23.
//

import UIKit

enum CyclePhase: String, CaseIterable {
    
    case folicular
    case menstruation
    case luteal
    case fertile
    case expectedMenstruation
    case pms
    case possibleMenstruation
    case none
    
    init?(rawValue: String) {
        switch rawValue {
        case L10n.Constants.Content.Label.folicular:
            self = .folicular
        case L10n.Constants.Content.Label.menstruation:
            self = .menstruation
        case L10n.Constants.Content.Label.luteal:
            self = .luteal
        case L10n.Constants.Content.Label.fertile:
            self = .fertile
        case L10n.Constants.Content.Label.expectedMenstruation:
            self = .expectedMenstruation
        case L10n.Constants.Content.Label.pms:
            self = .pms
        default:
            self = .none
        }
    }
    
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
        case .possibleMenstruation:
            return "Possível menstruação"
        default:
            return ""
        }
    }
        
    var image: UIImage {
        switch self {
        case .folicular:
            return Asset.follicularSelected.image
        case .menstruation:
            return Asset.menstruationSelected.image
        case .luteal:
            return Asset.lutealSelected.image
        case .fertile:
            return Asset.ovulationSelected.image
        case .expectedMenstruation:
            return Asset.expectedMenstruationSelected.image
        case .pms:
            return Asset.pmsSelected.image
        default:
            return Asset.noneSelected.image
        }
    }
    
    var activityCell: UIImage {
        switch self {
        case .pms:
            return Asset.pmsPhaseActivityCell.image
        case .folicular:
            return Asset.foliculePhaseActivityCell.image
            
        case .luteal:
            return Asset.ovulationPhaseActivityCell.image
    
        default:
            return Asset.pmsPhaseActivityCell.image
        }
    }
}
