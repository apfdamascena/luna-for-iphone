//
//  HomeView.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class HomeView: UIView, AnyView  {
    
    private var hasAcessToCalendar: CalendarAccess = .unauthorized

    private(set) var menstrualPhaseBehaviorsView = MenstrualPhaseBehaviorsView()
    private let learnAboutMenstrualCyclePhasesView = LearnAboutMenstrualCyclePhasesView()
    
    private(set) var calendarCollectionView = CalendarScrollCollectionView()
    private(set) var warningCalendarAccess = WarningCalendarAccess()
    
    private let monthTag = MonthTag()
    
    private let phaseCycleTitle = PhaseCycleTitle()
    private let learnCycleTitle = LearnCycleTitle()
    
    private let allContentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        return view
    }()
    
    private let descriptionStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        return view
    }()
    
    private let recordedMenstruationFeedback: FeedbackCard = {
        let card = FeedbackCard()
        card.message(for: .recordedMenstruation)
        card.isHidden = true
        return card
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let warningNoMenstrualData: WarningNoMenstrualData = {
        let view = WarningNoMenstrualData()
        view.isHidden = true
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
        
//        addSubview(monthTag)
//        addSubview(calendarCollectionView)
        addSubview(scrollView)
        
        addSubview(recordedMenstruationFeedback)
        scrollView.addSubview(allContentStackView)
        
        allContentStackView.addArrangedSubview(monthTag)
        allContentStackView.addArrangedSubview(calendarCollectionView)
        allContentStackView.addArrangedSubview(descriptionStackView)
        
        descriptionStackView.addArrangedSubview(warningCalendarAccess)
        descriptionStackView.addArrangedSubview(learnCycleTitle)
        descriptionStackView.addArrangedSubview(phaseCycleTitle)
        descriptionStackView.addArrangedSubview(menstrualPhaseBehaviorsView)
        descriptionStackView.addArrangedSubview(learnAboutMenstrualCyclePhasesView)
        descriptionStackView.addArrangedSubview(warningNoMenstrualData)
    }
    
    func addConstraints() {
        
        recordedMenstruationFeedback.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-3.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.height.equalTo(50)
        }
        
        calendarCollectionView.snp.makeConstraints{
            $0.height.equalTo(123)
            $0.leading.trailing.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        monthTag.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(3.su)
        }
        
        descriptionStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self).inset(3.su)
        }

        allContentStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.leading.width.equalTo(scrollView)
        }
        
        warningCalendarAccess.snp.makeConstraints {
            $0.height.equalTo(286)
        }
        
        phaseCycleTitle.snp.makeConstraints {
            $0.height.equalTo(77)
        }

        learnCycleTitle.snp.makeConstraints {
            $0.height.equalTo(8.su)
        }
        
        warningNoMenstrualData.snp.makeConstraints{
            $0.height.equalTo(20.su)
        }
        
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func userDeniedAccessCalendar() {
        self.toggleCalendarViewIfUserAccess(to: false)
        self.hasAcessToCalendar = .unauthorized
    }
    
    func userAllowedAccessCalendar() {
        self.hasAcessToCalendar = .authorized
        self.toggleCalendarViewIfUserAccess(to: true)
        
    }
    
    func cardFeedbackDisappear() {
        recordedMenstruationFeedback.isHidden = true
    }
    
    func cardFeedbackAppear() {
        recordedMenstruationFeedback.isHidden = false
    }
    
    func showWarningNoMenstrualData(if cycle: CyclePhase){
        
        if hasAcessToCalendar == .unauthorized {
            menstrualPhaseBehaviorsView.isHidden = true
            phaseCycleTitle.isHidden = true
            warningNoMenstrualData.isHidden = true
            return
        }
        
        menstrualPhaseBehaviorsView.isHidden = false
        phaseCycleTitle.isHidden = false
        warningNoMenstrualData.isHidden = true
        
    
        if cycle == .none {
            menstrualPhaseBehaviorsView.isHidden = true

            phaseCycleTitle.isHidden = true
            warningNoMenstrualData.isHidden = false
        }
    }
    
    func accessToCalendar(allowed: CalendarAccess){
        self.hasAcessToCalendar = allowed
    }
    
    private func toggleCalendarViewIfUserAccess(to value: Bool){
        [warningCalendarAccess, learnCycleTitle, learnAboutMenstrualCyclePhasesView]
            .forEach{
                $0.isHidden = value
            }
        [phaseCycleTitle, menstrualPhaseBehaviorsView].forEach{
            $0.isHidden = !value
        }
    }
    
    func phaseChanged(to cycle: CyclePhase) {

        DispatchQueue.main.async {
            let model = CyclePhaseTextFactory.create(phase: cycle)
            self.phaseCycleTitle.phaseTitle.text = model.name
            self.menstrualPhaseBehaviorsView.draw(model)
        }
    }
    
    func monthChanged(to date: Date) {
        DispatchQueue.main.async {
            self.monthTag.monthText.text = date.formatMonthToString().capitalized
        }
    }
    
}


