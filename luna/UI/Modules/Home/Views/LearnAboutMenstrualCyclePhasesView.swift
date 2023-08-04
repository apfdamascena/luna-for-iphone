//
//  InformationalPhase.swift
//  luna
//
//  Created by Cynara Costa on 29/07/23.
//

import UIKit
import SnapKit

class LearnAboutMenstrualCyclePhasesView: UIView, AnyView {
    
    private var teste: [CardHomeInformation] = []
    private let stopIndex = 4
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
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
        addSubview(stack)
        
        CyclePhase.allCases.enumerated().forEach { index, phase in
            guard index < stopIndex else { return }
            
            let card = CardHomeInformation()
            let model = CyclePhaseTextFactory.create(phase: phase)
            card.draw(model)
            card.title.text = model.name
            card.subtitle.text = model.whatIsDescription
            stack.addArrangedSubview(card)
        }
    
    }
    
    func addConstraints() {
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
