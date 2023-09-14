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
    
    private(set) var calendarCollectionView = CalendarScrollCollectionView()
    private(set) var warningCalendarAccess = WarningCalendarAccess()
    private let monthTag = MonthTag()
    
    private(set) var activitiesView = ActivitiesView()
    
    private let phaseCycleTitle = PhaseCycleTitle()
    
    private(set) var cardCycle = CycleCardView()
    
    private let recordedMenstruationFeedback: FeedbackCard = {
        let card = FeedbackCard()
        card.message(for: .recordedMenstruation)
        card.isHidden = true
        return card
    }()
    
    private let warningNoMenstrualData: WarningNoMenstrualData = {
        let view = WarningNoMenstrualData()
        view.isHidden = true
        return view
    }()

    
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
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        addSubview(scrollView)
        
        addSubview(recordedMenstruationFeedback)
        scrollView.addSubview(allContentStackView)
        
        allContentStackView.addArrangedSubview(monthTag)
        allContentStackView.addArrangedSubview(calendarCollectionView)
        
        allContentStackView.addArrangedSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(warningCalendarAccess)
        descriptionStackView.addArrangedSubview(phaseCycleTitle)
        descriptionStackView.addArrangedSubview(cardCycle)
        descriptionStackView.addArrangedSubview(warningNoMenstrualData)
        
        allContentStackView.addArrangedSubview(activitiesView)
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
            $0.top.equalToSuperview().offset(10.su)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        monthTag.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(3.su)
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
            $0.height.equalTo(72)
        }
        
        cardCycle.snp.makeConstraints {
            $0.height.equalTo(206)
        }
        
        warningNoMenstrualData.snp.makeConstraints{
            $0.height.equalTo(46.su)
        }
        
        activitiesView.snp.makeConstraints{
            $0.height.equalTo(50.su)
            $0.leading.trailing.equalTo(self).inset(3.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        cardCycle.contentMode = .scaleAspectFit
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
            
            phaseCycleTitle.isHidden = true
            warningNoMenstrualData.isHidden = true
            cardCycle.isHidden = true
            return
        }
        
        
        phaseCycleTitle.isHidden = false
        warningNoMenstrualData.isHidden = true
        cardCycle.isHidden = false
        
    
        if cycle == .none {

            phaseCycleTitle.isHidden = true
            cardCycle.isHidden = true
            warningNoMenstrualData.isHidden = false
        }
    }
    
    func accessToCalendar(allowed: CalendarAccess){
        self.hasAcessToCalendar = allowed
    }
    
    private func toggleCalendarViewIfUserAccess(to value: Bool){
        [warningCalendarAccess]
            .forEach{
                $0.isHidden = value
            }
        [phaseCycleTitle].forEach{
            $0.isHidden = !value
        }
    }
    
    func phaseChanged(to cycle: CyclePhase) {
        DispatchQueue.main.async {
            let model = CyclePhaseTextFactory.create(phase: cycle)
            let modelCard = DynamicCardPhaseFactory.create(phase: cycle)
            self.phaseCycleTitle.phaseTitle.text = model.name
            self.cardCycle.draw(modelCard)
        }
    }
    
    func monthChanged(to date: Date) {
        DispatchQueue.main.async {
            self.monthTag.formattText(day: date.formatDayToString(), month: date.formatMonthToString())
        }
    }
    
    func flowIndexChanged(to index: Int) {
        DispatchQueue.main.async {
            self.cardCycle.updateFlowIndex(index: index)
        }
    }
    
    func drawActivities(_ data: [String]){
        
        let activities = data.map{ _ in
            return ActivityCell()
        }
        
        activitiesView.createTableWithActivities(activities)
        
        activitiesView.snp.removeConstraints()
        let size =  (data.count+1) * 80 + 12 * (data.count-1) + 60
        
        activitiesView.snp.makeConstraints{
            $0.height.equalTo(size)
            $0.leading.trailing.equalTo(self).inset(3.su)
        }
    }
    
}

