//
//  OnboardingCyclePhaseCard.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//

import UIKit
import SnapKit

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

class OnboardingCyclePhaseCard: UIView,
                                AnyView,
                                DrawableView  {
    
    typealias ViewModel = OnboardingCyclePhaseContentViewModel
    
    let phaseCardContent = OnboardingCyclePhaseContent()
    
    let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2.su
        return stack
    }()
    
    let phase = UIImageView()
    
    init(style: OnboardingCyclePhaseCardType){
        super.init(frame: .zero)
        setupView()
        draw(style.model)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(phase)
        horizontalStack.addArrangedSubview(phaseCardContent)
        
    }
    
    func addConstraints() {
        
        horizontalStack.snp.makeConstraints{
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
        
        phase.snp.makeConstraints{
            $0.width.equalTo(7.su)
        }
    }
    
    func draw(_ model: OnboardingCyclePhaseContentViewModel) {
        phaseCardContent.draw(model)
        phase.image = model.image
    }
}
