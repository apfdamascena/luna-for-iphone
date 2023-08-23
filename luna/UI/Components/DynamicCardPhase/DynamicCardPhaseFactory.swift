//
//  DynamicCardPhaseFactory.swift
//  luna
//
//  Created by Cynara Costa on 23/08/23.
//

import UIKit

class DynamicCardPhaseFactory {
    
    static func create(phase: CyclePhase) -> DynamicCardPhaseViewModel {
        switch phase {
        case .menstruation:
            return DynamicCardPhaseViewModel(backgroundImage: Asset.backgroundMenstruation1.image, titleText: "Você está literalmente sangrando!")
        case .fertile:
            return DynamicCardPhaseViewModel(backgroundImage: Asset.backgroundOvulation1.image, titleText: "Você está literalmente ovulando!")
        case .folicular:
            return DynamicCardPhaseViewModel(backgroundImage: Asset.backgroundFolicule1.image, titleText: "Você está literalmente foliculando!")
        case .luteal:
            return DynamicCardPhaseViewModel(backgroundImage: Asset.backgroundLuteal1.image, titleText: "Você está literalmente luteando!")
        case .pms:
            return DynamicCardPhaseViewModel(backgroundImage: Asset.backgroundPms1.image, titleText: "Você está literalmente na tpm!")
        default:
            return DynamicCardPhaseViewModel(backgroundImage: Asset.backgroundMenstruation1.image, titleText: "Eu literalmente não sei o que escrever!")
        }
    }
    
}
