//
//  BestActivityFactory.swift
//  luna
//
//  Created by sml on 13/09/23.
//

import UIKit

class BestActivityFactory {
    static func create(phase: CyclePhase, dates: DateInterval) -> BestActivityViewModel {
        switch phase {
        case .menstruation:
            return BestActivityViewModel(
                cycleImage: Asset.bestMenstruation.image,
                phaseTitle: "\(L10n.Constants.Content.Label.Phase.menstruation)!",
                dates: dates)
        case .fertile:
            return BestActivityViewModel(
                cycleImage: Asset.bestOvulation.image,
                phaseTitle: "\(L10n.Constants.Content.Label.Phase.fertile)!",
                dates: dates)
        case .folicular:
            return BestActivityViewModel(
                cycleImage: Asset.bestFolicular.image,
                phaseTitle: "\(L10n.Constants.Content.Label.Phase.folicular)!",
                dates: dates)
        case .luteal:
            return BestActivityViewModel(
                cycleImage: Asset.bestLuteal.image,
                phaseTitle: "\(L10n.Constants.Content.Label.Phase.luteal)!",
                dates: dates)
            
        case .pms:
            return BestActivityViewModel(
                cycleImage: Asset.bestPms.image,
                phaseTitle: "\(L10n.Constants.Content.Label.Phase.pms)!",
                dates: dates)
        default:
            return BestActivityViewModel(
                cycleImage: Asset.bestMenstruation.image,
                phaseTitle: "\(L10n.Constants.Content.Label.Phase.menstruation)!",
                dates: dates)
        }
    }
    
}
