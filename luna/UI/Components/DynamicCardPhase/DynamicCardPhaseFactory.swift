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
            return DynamicCardPhaseViewModel(
                backgroundImage: [
                    Asset.backgroundMenstruation1.image,
                    Asset.backgroundMenstruation2.image,
                    Asset.backgroundMenstruation3.image,
                    Asset.backgroundMenstruation4.image,
                    Asset.backgroundMenstruation5.image,
            ],
                titleText: [
                    L10n.Constants.Content.Label.Home.Card.Menstruation.one,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.two,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.three,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.four,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.five,
                ])
            
        case .fertile:
            return DynamicCardPhaseViewModel(
                backgroundImage:
                    [
                        Asset.backgroundOvulation1.image,
                        Asset.backgroundOvulation2.image,
                        Asset.backgroundOvulation3.image,
                        Asset.backgroundOvulation4.image,
                        Asset.backgroundOvulation5.image,
                    ],
                titleText:
                    [
                        L10n.Constants.Content.Label.Home.Card.Ovulation.one,
                        L10n.Constants.Content.Label.Home.Card.Ovulation.two,
                        L10n.Constants.Content.Label.Home.Card.Ovulation.three,
                        L10n.Constants.Content.Label.Home.Card.Ovulation.four,
                        L10n.Constants.Content.Label.Home.Card.Ovulation.five,
                    ])
            
        case .folicular:
            return DynamicCardPhaseViewModel(
                backgroundImage:
                    [
                        Asset.backgroundFolicule1.image,
                        Asset.backgroundFolicule2.image,
                        Asset.backgroundFolicule3.image,
                        Asset.backgroundFolicule4.image,
                        Asset.backgroundFolicule5.image,
                    ],
                titleText: [
                    L10n.Constants.Content.Label.Home.Card.Folicular.one,
                    L10n.Constants.Content.Label.Home.Card.Folicular.two,
                    L10n.Constants.Content.Label.Home.Card.Folicular.three,
                    L10n.Constants.Content.Label.Home.Card.Folicular.four,
                    L10n.Constants.Content.Label.Home.Card.Folicular.five,
                ])
            
        case .luteal:
            return DynamicCardPhaseViewModel(
                backgroundImage: [
                    Asset.backgroundLuteal1.image,
                    Asset.backgroundLuteal2.image,
                    Asset.backgroundLuteal3.image,
                    Asset.backgroundLuteal4.image,
                    Asset.backgroundLuteal5.image,
                ],
                titleText: [
                    L10n.Constants.Content.Label.Home.Card.Luteal.one,
                    L10n.Constants.Content.Label.Home.Card.Luteal.two,
                    L10n.Constants.Content.Label.Home.Card.Luteal.three,
                    L10n.Constants.Content.Label.Home.Card.Luteal.four,
                    L10n.Constants.Content.Label.Home.Card.Luteal.five,
                ])
            
        case .pms:
            return DynamicCardPhaseViewModel(
                backgroundImage: [
                    Asset.backgroundPms1.image,
                    Asset.backgroundPms2.image,
                    Asset.backgroundPms3.image,
                    Asset.backgroundPms4.image,
                    Asset.backgroundPms5.image,
                ],
                titleText: [
                    L10n.Constants.Content.Label.Home.Card.Pms.one,
                    L10n.Constants.Content.Label.Home.Card.Pms.two,
                    L10n.Constants.Content.Label.Home.Card.Pms.three,
                    L10n.Constants.Content.Label.Home.Card.Pms.four,
                    L10n.Constants.Content.Label.Home.Card.Pms.five,
                ])
            
        case .expectedMenstruation:
            return DynamicCardPhaseViewModel(
                backgroundImage: [
                    Asset.backgroundMenstruation1.image,
                    Asset.backgroundMenstruation2.image,
                    Asset.backgroundMenstruation3.image,
                    Asset.backgroundMenstruation4.image,
                    Asset.backgroundMenstruation5.image,
            ],
                titleText: [
                    L10n.Constants.Content.Label.Home.Card.Menstruation.one,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.two,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.three,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.four,
                    L10n.Constants.Content.Label.Home.Card.Menstruation.five,
                ])
            
        default:
            return DynamicCardPhaseViewModel(
                backgroundImage: [
                    Asset.backgroundMenstruation1.image,
                    Asset.backgroundMenstruation2.image,
                    Asset.backgroundMenstruation3.image,
                    Asset.backgroundMenstruation4.image,
                    Asset.backgroundMenstruation5.image,
                ],
                titleText: [
                    L10n.Constants.Content.Label.Home.Card.Pms.one,
                    L10n.Constants.Content.Label.Home.Card.Pms.two,
                    L10n.Constants.Content.Label.Home.Card.Pms.three,
                    L10n.Constants.Content.Label.Home.Card.Pms.four,
                    L10n.Constants.Content.Label.Home.Card.Pms.five,
                ])
        }
    }
    
}
