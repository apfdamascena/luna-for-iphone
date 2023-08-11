//
//  PhaseTitle.swift
//  luna
//
//  Created by alexdamascena on 10/08/23.
//

import UIKit

class PhaseCycleTitle: UIStackView, AnyView {
    
    private let youAreInLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.youAreIn
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    var phaseTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 40, color: .black, weight: .semibold)
        label.text = L10n.Constants.Content.Label.Home.menstruation
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
        
        addArrangedSubview(youAreInLabel)
        addArrangedSubview(phaseTitle)
        
    }
    
    func addAdditionalConfiguration() {
        axis = .vertical
        alignment = .leading
        spacing = 0
    }

}
