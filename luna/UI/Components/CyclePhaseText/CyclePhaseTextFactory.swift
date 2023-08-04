//
//  CyclePhaseText.swift
//  luna
//
//  Created by Cynara Costa on 01/08/23.
//

import UIKit

class CyclePhaseTextFactory {
    
    static func create(phase: CyclePhase) -> CyclePhaseTextViewModel {
        switch phase {
        case .menstruation, .expectedMenstruation:
            return CyclePhaseTextViewModel(
                name: L10n.Constants.Content.Label.Phase.menstruation,
                whatIsDescription: L10n.Constants.Content.Label.Text.WhatIs.menstruation,
                howAreYouDescription: L10n.Constants.Content.Label.Text.HowAreYou.menstruation,
                avoidDescription: L10n.Constants.Content.Label.Text.Avoid.menstruation,
                helpDescription: L10n.Constants.Content.Label.Text.Help.menstruation,
                behindSheets: L10n.Constants.Content.Label.Text.BehindSheets.menstruation
            )
        case .fertile:
            return CyclePhaseTextViewModel(
                name: L10n.Constants.Content.Label.Phase.fertile,
                whatIsDescription: L10n.Constants.Content.Label.Text.WhatIs.fertile,
                howAreYouDescription: L10n.Constants.Content.Label.Text.HowAreYou.fertile,
                avoidDescription: L10n.Constants.Content.Label.Text.Avoid.fertile,
                helpDescription: L10n.Constants.Content.Label.Text.Help.fertile,
                behindSheets: L10n.Constants.Content.Label.Text.BehindSheets.fertile
            )
        case .luteal:
            return CyclePhaseTextViewModel(
                name: L10n.Constants.Content.Label.Phase.luteal,
                whatIsDescription: L10n.Constants.Content.Label.Text.WhatIs.luteal,
                howAreYouDescription: L10n.Constants.Content.Label.Text.HowAreYou.luteal,
                avoidDescription: L10n.Constants.Content.Label.Text.Avoid.luteal,
                helpDescription: L10n.Constants.Content.Label.Text.Help.luteal,
                behindSheets: L10n.Constants.Content.Label.Text.BehindSheets.luteal
            )
        case .folicular:
            return CyclePhaseTextViewModel(
                name: L10n.Constants.Content.Label.Phase.folicular,
                whatIsDescription: L10n.Constants.Content.Label.Text.WhatIs.folicular,
                howAreYouDescription: L10n.Constants.Content.Label.Text.HowAreYou.folicular,
                avoidDescription: L10n.Constants.Content.Label.Text.Avoid.folicular,
                helpDescription: L10n.Constants.Content.Label.Text.Help.folicular,
                behindSheets: L10n.Constants.Content.Label.Text.BehindSheets.folicular
            )
            
        default:
            return CyclePhaseTextViewModel(
                name: "Cynara Valéria",
                whatIsDescription: L10n.Constants.Content.Label.Text.WhatIs.folicular,
                howAreYouDescription: L10n.Constants.Content.Label.Text.HowAreYou.folicular,
                avoidDescription: L10n.Constants.Content.Label.Text.Avoid.folicular,
                helpDescription: L10n.Constants.Content.Label.Text.Help.folicular,
                behindSheets: L10n.Constants.Content.Label.Text.BehindSheets.folicular
            )
        }
    }
        
}
