//
//  OnboardingCyclePhaseCardType.swift
//  luna
//
//  Created by alexdamascena on 31/07/23.
//

import Foundation

enum OnboardingCyclePhaseCardType {
    
    case menstruation
    case forecast
    case ovulation
    case follicular
    case luteal
    
    var model: OnboardingCyclePhaseContentViewModel {
        
        switch self {
        case .menstruation:
            return OnboardingCyclePhaseContentViewModel(title: L10n.Constants.Content.Label.onboardingRegisterMenstruation,
                                                        subtitle: L10n.Constants.Content.Label.onboardingRegisterMenstruationDescription,
                                                        image: Asset.menstruationCell.image)
        case .forecast:
            return OnboardingCyclePhaseContentViewModel(title: L10n.Constants.Content.Label.onboardingForecast,
                                                        subtitle: L10n.Constants.Content.Label.onboardingForecastDescription,
                                                        image: Asset.forecastCell.image)
        case .ovulation:
            return OnboardingCyclePhaseContentViewModel(title: L10n.Constants.Content.Label.onboardingOvulation,
                                                        subtitle: L10n.Constants.Content.Label.onboardingOvulationDescription,
                                                        image: Asset.ovulationCell.image)
        case .follicular:
            return OnboardingCyclePhaseContentViewModel(title: L10n.Constants.Content.Label.onboardingFolicule,
                                                        subtitle: L10n.Constants.Content.Label.onboardingFoliculeDescription,
                                                        image: Asset.foliculeCell.image)
        case .luteal:
            return OnboardingCyclePhaseContentViewModel(title: L10n.Constants.Content.Label.onboardingLuteal,
                                                        subtitle: L10n.Constants.Content.Label.onboardingLutealDescription,
                                                        image: Asset.lutealCell.image)
        }
    }
}
