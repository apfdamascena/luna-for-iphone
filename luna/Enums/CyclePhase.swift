//
//  CyclePhase.swift
//  luna
//
//  Created by sml on 27/07/23.
//

import UIKit

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
            return Asset.previsionSelected.image
            
        default:
            return Asset.noneSelected.image
        }
    }
}
