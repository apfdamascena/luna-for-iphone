//
//  CyclePhase.swift
//  luna
//
//  Created by gabrielfelipo on 26/07/23.
//

import UIKit

enum CyclePhase: String {
    case folicular = "Fase folicular"
    case menstruation = "Menstruação"
    case luteal  = "Fase lútea"
    case ovulacao =  "Período fertil"
    case none = "none"
    case pms = "TPM"
    
    var image: UIImage {
        switch self {
        case .folicular:
            return Asset.follicularSelected.image
        case .menstruation:
            return Asset.menstruationSelected.image
        case .luteal:
            return Asset.lutealSelected.image
        case .ovulacao:
            return Asset.ovulationSelected.image
            
        default:
            return Asset.noneSelected.image
        }
    }
}
