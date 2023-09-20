//
//  HomeView.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class HomeView: UIView, AnyView  {
    public var hasAcessToCalendar: CalendarAccess
    
    private(set) var calendarCollectionView = CalendarScrollCollectionView()
    private(set) var warningCalendarAccess = WarningCalendarAccess()
    
    private let monthTag = MonthTag()
    
    private let phaseCycleTitle = PhaseCycleTitle()
    
    var referencesButton: LunaButton {
        return phaseCycleTitle.readReferencesButton
    }
    
    private(set) var cardCycle = CycleCardView()
    
    private let allContentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        
        return view
    }()
    
    private let phaseCycleSkeleton: PhaseCycleTitle = {
        let view = PhaseCycleTitle()
        view.phaseTitle.textColor = .white
        view.youAreInLabel.textColor = .white
        view.showAnimatedSkeleton()
        return view
    }()
    
    private let collectionViewSkeleton: UIView = {
        let view = UIView()
        view.isSkeletonable = true
        return view
    }()
    
    private let cardSkeleton: UIView = {
        let view = UIView()
        view.isSkeletonable = true
        return view
    }()
    
    private let skeletonBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let descriptionStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        return view
    }()
    
    private var recordedMenstruationFeedback: FeedbackCard = {
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
        self.hasAcessToCalendar = .unauthorized
        super.init(frame: frame)
        isSkeletonable = true
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
        
        addSubview(skeletonBackground)
        addSubview(phaseCycleSkeleton)
        addSubview(collectionViewSkeleton)
        addSubview(cardSkeleton)
        
    }
    
    func addConstraints() {
        
        skeletonBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        recordedMenstruationFeedback.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-3.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.height.equalTo(50)
        }
        
        calendarCollectionView.snp.makeConstraints{
            $0.height.equalTo(123)
            $0.leading.trailing.equalToSuperview()
        }
        
        collectionViewSkeleton.snp.makeConstraints {
            $0.edges.equalTo(calendarCollectionView)
        }
        
        cardSkeleton.snp.makeConstraints {
            $0.height.width.centerX.equalTo(cardCycle)
            $0.bottom.equalTo(cardCycle).offset(3.su)
        }
        
        phaseCycleSkeleton.snp.makeConstraints {
            $0.edges.equalTo(phaseCycleTitle)
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
            $0.height.equalTo(96)
        }
        
        cardCycle.snp.makeConstraints {
            $0.height.equalTo(206)
        }
        
        warningNoMenstrualData.snp.makeConstraints{
            $0.height.equalTo(46.su)
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
    
    func updateState(_ state: HomeViewState) {
        switch state {
        case .loading:
            userAllowedAccessCalendar()
            appearSkeleton()
            
        case .autorized:
            userAllowedAccessCalendar()
            disapearSkeleton()
            
        case .unautorized:
            userDeniedAccessCalendar()
            disapearSkeleton()
        }
    }
    
    func appearSkeleton() {
        
        DispatchQueue.main.async {
            [
                self.collectionViewSkeleton,
                self.cardSkeleton,
                self.phaseCycleSkeleton
            ].forEach {
                $0.showAnimatedSkeleton()
            }
            
        }
        
    }
    
    func disapearSkeleton() {
        [
            self.collectionViewSkeleton,
            self.cardSkeleton,
            self.phaseCycleSkeleton
        ].forEach {
            $0.hideSkeleton()
        }
        
        collectionViewSkeleton.isHidden = true
        cardSkeleton.isHidden = true
        skeletonBackground.isHidden = true
        phaseCycleSkeleton.isHidden = true
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
            let model = CyclePhaseTextFactory.create(phase: cycle)
            let modelCard = DynamicCardPhaseFactory.create(phase: cycle)
            self.phaseCycleTitle.phaseTitle.text = model.name
            self.cardCycle.draw(modelCard)
    }
    
    func monthChanged(to date: Date) {
            self.monthTag.formattText(day: date.formatDayToString(), month: date.formatMonthToString())
        
    }
    
    func flowIndexChanged(to index: Int) {
            self.cardCycle.updateFlowIndex(index: index)
        
    }
    
}

