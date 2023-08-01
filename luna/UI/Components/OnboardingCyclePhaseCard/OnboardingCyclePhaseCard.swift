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
    
    private let phaseCardContent = OnboardingCyclePhaseContent()
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2.su
        return stack
    }()
    
    private let phase = UIImageView()
    
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
