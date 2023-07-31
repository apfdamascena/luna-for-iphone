//
//  OnboardingCyclePhaseCard.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//

import UIKit
import SnapKit

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
    
    let phase: UIImageView = {
        let view = UIImageView(image: Asset.cellToTeste.image)
        return view
    }()
    
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
    }
    
    func draw(_ model: OnboardingCyclePhaseContentViewModel) {
        phaseCardContent.draw(model)
    }
}
