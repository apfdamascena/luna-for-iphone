//
//  InformationalPhase.swift
//  luna
//
//  Created by Cynara Costa on 29/07/23.
//

import UIKit
import SnapKit

class InformationalPhaseText: UIView, AnyView {
    
    private let whatIsTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Home.Informational.what
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let whatIsText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Placeholder.big
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let stackWhatIs: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = (1.5).su
        return view
    }()
    
    private let whatToDoTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Home.Informational.do
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let whatToDoText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Placeholder.bullet
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let whatToDoText2: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Placeholder.bullet
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let whatToDoText3: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Placeholder.bullet
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let stackWhatToDo: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = (1.5).su
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
        stackWhatIs.addArrangedSubview(whatIsTitle)
        stackWhatIs.addArrangedSubview(whatIsText)
        stackWhatToDo.addArrangedSubview(whatToDoTitle)
        stackWhatToDo.addArrangedSubview(whatToDoText)
        stackWhatToDo.addArrangedSubview(whatToDoText2)
        stackWhatToDo.addArrangedSubview(whatToDoText3)
        addSubview(stackWhatIs)
        addSubview(stackWhatToDo)
    }
    
    func addConstraints() {
        
        stackWhatIs.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        stackWhatToDo.snp.makeConstraints {
            $0.top.equalTo(stackWhatIs.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(60)
            $0.bottom.equalToSuperview().offset(-80)
        }
        
    }
    
    func addAdditionalConfiguration() {
        
    }
    
}
