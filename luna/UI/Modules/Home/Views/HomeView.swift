//
//  HomeView.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class HomeView: UIView, AnyView  {
    
    private(set) var calendarCollectionView = CalendarScrollCollectionView()
    
    private let calendarSyncView = WarningCalendarAccess()
    private let recordedMenstruationCardView = FeedbackCard()
        
    private let cardsView = HomeCardView()
    private let learnView = HomeLearnView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private let contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        return view
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
        
        stackPhaseCycle.addArrangedSubview(youAreInLabel)
        stackPhaseCycle.addArrangedSubview(phaseTitle)
        stackPhaseLearn.addArrangedSubview(learnCycleTitle)
        stackPhaseLearn.addArrangedSubview(cyclePhasesTitle)
        
        addSubview(calendarCollectionView)
        addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addArrangedSubview(stackPhaseCycle)
        contentView.addArrangedSubview(calendarSyncView)
        contentView.addArrangedSubview(stackPhaseLearn)
    
        contentView.addArrangedSubview(cardsView)
        contentView.addArrangedSubview(learnView)
        
        addSubview(recordedMenstruationCardView)
        
    }
    
    func addConstraints() {
        
        recordedMenstruationCardView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-3.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.height.equalTo(50)
        }
        
        calendarCollectionView.snp.makeConstraints{
            $0.height.equalTo(123)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(calendarCollectionView.snp.bottom).offset(3.su)
            $0.leading.trailing.equalTo(self).inset(3.su)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.leading.width.equalTo(scrollView)
        }
        
        calendarSyncView.snp.makeConstraints {
            $0.height.equalTo(286)
        }
        
        stackPhaseCycle.snp.makeConstraints {
            $0.height.equalTo(77)
        }

        stackPhaseLearn.snp.makeConstraints {
            $0.height.equalTo(8.su)
        }
        
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func userDeniedAccessCalendar() {
        stackPhaseCycle.isHidden = true
        cardsView.isHidden = true
        
        calendarSyncView.isHidden = false
        stackPhaseLearn.isHidden = false
        learnView.isHidden = false
    }
    
    func userAllowedAccessCalendar() {
        calendarSyncView.isHidden = true
        stackPhaseLearn.isHidden = true
        learnView.isHidden = true
        
        stackPhaseCycle.isHidden = false
        cardsView.isHidden = false
    }
    
    func cardFeedbackDisappear() {
        recordedMenstruationCardView.isHidden = true
    }
    
    func phaseChanged(to cycle: CyclePhase) {
        DispatchQueue.main.async {
            let model = CyclePhaseTextFactory.create(phase: cycle)
            self.phaseTitle.text = model.name
            self.cardsView.draw(model)
        }
    }
    
}


