//
//  HomeViewController.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseAnalytics
import SkeletonView
import EventKit
import EventKitUI

class HomeViewController: UIViewController {

    var presenter: ViewToPresenterHomeProtocol?
    
    private let homeView = HomeView()
    private var disposeBag = DisposeBag()
    
    private var timer: Timer!
    
    private var datasource: CalendarCollectionViewDataSource
    private var cardPhaseDataSource: CardPhaseControlDataSource
    private var activitiesDataSource: ActivityDataSource

    private let notificationStation = NotificationStation()
    
    init(
        datasource: CalendarCollectionViewDataSource = CalendarCollectionViewDataSourceImpl(),
        cardPhaseDataSource: CardPhaseControlDataSource = CardPhaseControlDataSourceImpl(),
        activitiesDataSource: ActivityDataSource = ActivityDataSourceImpl()
    ){
        self.datasource = datasource
        self.cardPhaseDataSource = cardPhaseDataSource
        self.activitiesDataSource = activitiesDataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = homeView
        
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        presenter?.checkCalendarPermission()
        
        homeView.appearSkeleton()
        
        addCollectionViewDataSource()
        addCalendarEventObservable()
        addCyclePhaseEventObservable()
        addSettingsHandlerEvent()
        cardCyclePhaseHandler()
        addTapRightSideCardCycleEventObservable()
        addTapLeftSideCardCycleEventObservable()
        addNotificationEventObservable()
        addSegmentedControlDataSourceEventObservable()
        addSegmentedControlPeriodEventObservable()
        addTableViewDataSourceEventObservable()
        addNewActivityTrriggerEventObservable()
        
        presenter?.loadCalendarToCollection(isloading: true)
        schedulerNextCardPhaseInformation()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true

        DispatchQueue.main.async {
            self.presenter?.loadActivitiesDataSource()
            self.checkLunaCalendarToken()
            self.startTimer()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeView.calendarCollectionView.setMargin(with: self.view.frame.width)
        
        guard let teste = try? self.datasource.cyclePhase.value() else  { return }
        AnalyticsCenter.shared.post(AnalyticsEvents.openApp(teste))
        
        moveInitialCollection()

    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fetchState), userInfo: nil, repeats: false)
    }
    
    @objc func fetchState() {
        presenter?.loadCalendarToCollection(isloading: false)
    }
    
    private func addCollectionViewDataSource(){
        
        datasource.data.bind(to: homeView.calendarCollectionView
            .rx.items(cellIdentifier: CalendarCollectionViewCell.IDENTIFIER,
                      cellType: CalendarCollectionViewCell.self)){ _, day, cell in
            cell.draw(day)
        }.disposed(by: disposeBag)
        
    }
    
    private func addNotificationEventObservable(){
        
        datasource.data
            .asObservable()
            .subscribe(onNext: { cycleDays in
                let cycleDaysFromToday = cycleDays.filter{ $0.day > Date() }
                self.notificationStation.addScheduleNotification(for: cycleDaysFromToday)
            })
            .disposed(by: disposeBag)
    }
    
    func addCalendarEventObservable() {
        
        homeView.calendarCollectionView
            .rx.scrollToCenter
            .subscribe(onNext: { centerCell, phase, month in
                guard let menstruationPhase = phase,
                      let calendarMonth = month else { return }
                self.presenter?.moveTo(centerCell)
                self.presenter?.moveTo(calendarMonth)
                self.datasource.cyclePhase.onNext(menstruationPhase)
            }).disposed(by: disposeBag)
        
        homeView.calendarCollectionView
            .rx.selectItemAtCalendar
            .subscribe(onNext: { selectedCell, centerCell, centerXtoCollection in
                self.presenter?.userSelect(selectedCell,
                                           center: centerCell,
                                           andMoveCenter: centerXtoCollection)
            }).disposed(by: disposeBag)
    }
    
    func addCyclePhaseEventObservable() {
        
        datasource.cyclePhase
            .asObservable()
            .subscribe(onNext: { cycle in
                self.homeView.phaseChanged(to: cycle)
                self.homeView.showWarningNoMenstrualData(if: cycle)
                self.cardPhaseDataSource.index.onNext(0)
            }).disposed(by: disposeBag)
    }
    
    func addSettingsHandlerEvent(){
        
        homeView
            .warningCalendarAccess
            .settingsButton.rx.tap.bind {
                self.presenter?.userOpenDeviceSettings()
            }.disposed(by: disposeBag)
    }
    

    func idealPhase(stress: String, sociability: String, fisicalEffort: String, finalDate: Date) {
        let stressInt = stress.toInt()
        let sociabilityInt = sociability.toInt()
        let fisicalEffortInt = fisicalEffort.toInt()
        let idealEvent = presenter?.findBestPhase(
            activity: ActivityMetrics(
                stress: stressInt,
                sociability: sociabilityInt,
                fisicalEffort: fisicalEffortInt,
                finalDate: finalDate
            )
        )
        let idealEventTitle = idealEvent?.title ?? "Default"
        let cyclePhase = CyclePhase(rawValue: idealEventTitle) ?? .none
        NewActivityInformations.shared.setBestPhase(cyclePhase)
        NewActivityInformations.shared.setDateInterval(DateInterval(start: (idealEvent?.startDate)!, end: (idealEvent?.endDate)!))
    }
    
    func addTapRightSideCardCycleEventObservable() {
        
        let tapGesture = UITapGestureRecognizer()
        homeView.cardCycle.rightView.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind(onNext: { _ in
            guard let currentIndex = try? self.cardPhaseDataSource.index.value() else { return }
            self.presenter?.userTappedRightSideCardPhase(at: currentIndex)
            guard let teste = try? self.datasource.cyclePhase.value() else  { return }
            AnalyticsCenter.shared.post(AnalyticsEvents.clickPhaseCard(teste))
        })
        .disposed(by: disposeBag)
    }
    
    func addTapLeftSideCardCycleEventObservable() {
        
        let tapGesture = UITapGestureRecognizer()
        homeView.cardCycle.leftView.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind(onNext: { _ in
            guard let currentIndex = try? self.cardPhaseDataSource.index.value() else { return }
            self.presenter?.userTappedLeftSideCardPhase(at: currentIndex)
            guard let teste = try? self.datasource.cyclePhase.value() else  { return }
            AnalyticsCenter.shared.post(AnalyticsEvents.clickPhaseCard(teste))
        })
        .disposed(by: disposeBag)
    }
    
    func cardCyclePhaseHandler() {
        
        Observable.combineLatest(datasource.cyclePhase, cardPhaseDataSource.index)
            .asObservable()
            .subscribe(onNext: { cycle, index in
                let model = DynamicCardPhaseFactory.create(phase: cycle)
                self.homeView.cardCycle.updateCardPhase(image: model.backgroundImage[index],
                                                        text: model.titleText[index])
                self.homeView.flowIndexChanged(to: index)
            })
            .disposed(by: disposeBag)
    }
    
    func addSegmentedControlPeriodEventObservable(){
        homeView.activitiesView
            .segmentedControl.rx
            .selectedSegmentIndex.asObservable()
            .map{ index in
                return ActivityPeriod(index)
            }.subscribe(onNext: { activity in
                guard let activitiesValue = try? self.activitiesDataSource.activitiesForSegmentedControl.value() else { return }
                let activities = activity == .week ? activitiesValue.week : activitiesValue.month
                
                self.activitiesDataSource.activities.onNext(activities)
                self.homeView.drawActivities(activities)
            })
            .disposed(by: disposeBag)
    }
    
    func addSegmentedControlDataSourceEventObservable(){
        activitiesDataSource.activities.bind(to: homeView.activities
            .rx.items(cellIdentifier: ActivityCell.IDENTIFIER,
                      cellType: ActivityCell.self)){ _, activity, cell in
            cell.draw(activity)
        }.disposed(by: disposeBag)
        
        homeView.activities
                .rx
                .modelSelected(ActivityCellViewModel.self)
                .subscribe(onNext: { model in
                    self.presenter?.openCalendarOnLuna(withEvent: model.activity)
                }).disposed(by: disposeBag)
    }
    
    func addTableViewDataSourceEventObservable(){
        activitiesDataSource.activities
            .asObservable()
            .subscribe(onNext: { data in
                self.homeView.drawActivities(data)
        }).disposed(by: disposeBag)
    }
    
    func addNewActivityTrriggerEventObservable(){
        homeView
            .newActivityButton
            .rx.tap.bind {
                self.tabBarController?.selectedIndex = 1
            }
            .disposed(by: disposeBag)
    }
    
    func checkLunaCalendarToken() {
        guard let selectedDay = presenter?.getFirstDayLastMenstruation() else {
            return
        }
        
        presenter?.insertMenstruation(selectedDate: selectedDay)
        presenter?.insertMenstruation(selectedDate: selectedDay)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag)
    }
    
    func schedulerNextCardPhaseInformation(){
        Timer.scheduledTimer(timeInterval: 7,
                             target: self,
                             selector: #selector(giveNextCardPhaseInformation),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc func giveNextCardPhaseInformation(){
        guard let index = try? cardPhaseDataSource.index.value() else { return }
        self.presenter?.userTappedRightSideCardPhase(at: index)
    }
}


extension HomeViewController: PresenterToViewHomeProtocol {
    
    func didUpdateState(_ state: HomeViewState) {
        homeView.updateState(state)
        }
    
    func moveTo(_ month: Date) {
        self.homeView.monthChanged(to: month)
    }
    
    func moveInitialCollection() {
        guard let initialOffset = homeView.calendarCollectionView.getInitialOffset() else { return }
        homeView.calendarCollectionView.contentOffset.x = initialOffset
    }
    
    func load(collectionDataSource: [CyclePhaseViewModel]) {
        datasource.data.onNext(collectionDataSource)
        self.datasource.cyclePhase.onNext(collectionDataSource[HomeCollection.COLLECTION_RANGE/2].phase)
    }
    
    func loadActivity(dataSource: ActivityEventMonthWeek) {
        let newDataSouceMonth = dataSource.month.map { event in
            return ActivityCellViewModel(title: event.title, hourStart: event.startDate.formattHour(), hourEnd: event.endDate.formattHour(), day: event.startDate, phase: event.phase, activity: event.event!)
        }
        let newDataSouceWeek = dataSource.week.map { event in
            return ActivityCellViewModel(title: event.title, hourStart: event.startDate.formattHour(), hourEnd: event.endDate.formattHour(), day: event.startDate, phase: event.phase, activity: event.event!)
        }
        let newDataSource = ActivityFilter(week: newDataSouceWeek, month: newDataSouceMonth)
        
        activitiesDataSource.activitiesForSegmentedControl.onNext(newDataSource)
        activitiesDataSource.activities.onNext(newDataSource.week)
    }
    
    func moveCalendarCollection(toXAxis: CGFloat) {
        self.datasource.lastCell?.transformToStandard()
        self.homeView.calendarCollectionView.contentOffset.x = toXAxis
    }
    
    func showFeedbackRegisterMenstruation() {
        self.homeView.cardFeedbackAppear()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.homeView.cardFeedbackDisappear()
        }
    }
    
    func changeSelectedCell(selectedCell: CalendarCollectionViewCell) {
        let selectedIsBeforeToday = selectedCell.day! < Date()
        
        if selectedIsBeforeToday {
            let selectedDay = selectedCell.getDate()
            
            guard let insertedMenstruation = presenter?.insertMenstruation(selectedDate: selectedDay) else { return }
            
            if insertedMenstruation {
                presenter?.loadCalendarToCollection(isloading: false)
                
                let phase = selectedCell.getPhase()
                
                if phase != .menstruation {
                    showFeedbackRegisterMenstruation()
                }
            }
            else {
                let alert = UIAlertController(title: "Aviso",
                                              message: "Você atingiu a duração máxima de menstruação, tente retirar um dia do início ou final da menstruação.",
                                              preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: { _ in
                }))

                present(alert, animated: true, completion: nil)
                presenter?.loadCalendarToCollection(isloading: false)
            }
        }
        else {
            let alert = UIAlertController(title: "Aviso",
                                          message: "Você não pode marcar em dias futuros",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: { _ in
            }))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func userAllowedAccessCalendar() {
        self.homeView.userAllowedAccessCalendar()
        presenter?.loadUserCalendar()
    }
    
    func allowAccessCalendar() {
        self.homeView.userAllowedAccessCalendar()
    }
    
    func userDeniedAccessCalendar() {
        DispatchQueue.main.async {
            self.homeView.userDeniedAccessCalendar()
        }
    }
    
    func cardFeedbackDisappear() {
         DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
             self.homeView.cardFeedbackDisappear()
         }
    }
    
    @objc func updateView(_ center: CalendarCollectionViewCell) {
        if center != self.datasource.lastCell {
            vibrateDevice()
        }
        
        DispatchQueue.main.async {
            self.datasource.lastCell?.transformToStandard()
            center.transformToLarge()
            self.datasource.lastCell = center
        }
    }
    
    func vibrateDevice() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    @objc func changeCurrentIndexCardPhase(at newIndex: Int) {
        self.cardPhaseDataSource.index.onNext(newIndex)
    }
    
    func openCalendar(with event: EKEvent) {
        let calendar = LunaCalendarViewController(with: self)
        calendar.editViewDelegate = self
        calendar.event = event
        present(calendar, animated: true)
    }
}

extension HomeViewController: EKEventEditViewDelegate {
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        self.dismiss(animated: true)
    }
}



