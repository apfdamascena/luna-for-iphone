//
//  LearnCycleTitle.swift
//  luna
//
//  Created by alexdamascena on 10/08/23.
//

import UIKit

class LearnCycleTitle: UIStackView, AnyView {
    
    private let learnCycleTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.learnCycle
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let cyclePhasesTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Home.cyclePhases
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        addArrangedSubview(learnCycleTitle)
        addArrangedSubview(cyclePhasesTitle)

    }
    
    func addAdditionalConfiguration() {
        axis = .vertical
        alignment = .leading
        spacing = 0
    }
}
