//
//  HomeView.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class HomeView: UIView, AnyView  {
    
    private let calendarSyncView = CalendarSyncCard()
    private let informationalPhaseTextView = InformationalPhaseText()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .systemPink
        return scrollView
    }()

    private let placeHolder: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 48, color: .black, weight: .bold)
        label.text = "PLACEHOLDER"
        label.textAlignment = .center
        label.draw(model)
        return label
    }()
    
    private let youAreInLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.youAreIn
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let phaseTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 40, color: .black, weight: .semibold)
        label.text = L10n.Constants.Content.Label.Home.menstruation
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
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
    
    private let stackPhaseLearn: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 0
        return view
    }()
    
    private let stackPhaseCycle: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 0
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
        addSubview(placeHolder)
        addSubview(stackPhaseCycle)
        stackPhaseCycle.addArrangedSubview(youAreInLabel)
        stackPhaseCycle.addArrangedSubview(phaseTitle)
        stackPhaseLearn.addArrangedSubview(learnCycleTitle)
        stackPhaseLearn.addArrangedSubview(cyclePhasesTitle)
        addSubview(calendarSyncView)
        addSubview(stackPhaseLearn)
        addSubview(informationalPhaseTextView)
    }
    
    func addConstraints() {
        
        placeHolder.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(15.su)
        }
        
        stackPhaseCycle.snp.makeConstraints {
            $0.top.equalTo(placeHolder.snp.bottom).offset(5.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        calendarSyncView.snp.makeConstraints {
            $0.top.equalTo(stackPhaseCycle.snp.bottom).offset(5.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        stackPhaseLearn.snp.makeConstraints {
            $0.top.equalTo(calendarSyncView.snp.bottom).offset(4.su)
            $0.leading.equalToSuperview().inset(3.su)
        }
        
        informationalPhaseTextView.snp.makeConstraints {
            $0.top.equalTo(stackPhaseLearn.snp.bottom).offset(5.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }

    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

