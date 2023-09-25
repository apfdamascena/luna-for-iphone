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

class HomeViewController: UIViewController {
    
    var presenter: ViewToPresenterHomeProtocol?
    
    private let homeView = HomeView()
    private var disposeBag = DisposeBag()
    
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
        presenter?.checkCalendarPermission()
        
        addCollectionViewDataSource()
        addCalendarEventObservable()
        addCyclePhaseEventObservable()
        addSettingsHandlerEvent()
        cardCyclePhaseHandler()
        addTapCardCycleEventObservable()
        addNotificationEventObservable()
        addSegmentedControlDataSourceEventObservable()
        addSegmentedControlPeriodEventObservable()
        addTableViewDataSourceEventObservable()
        addNewActivityTrriggerEventObservable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true

        
        DispatchQueue.main.async {
            self.presenter?.loadCalendarToCollection()
            self.presenter?.loadActivitiesDataSource()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeView.calendarCollectionView.setMargin(with: self.view.frame.width)
        
        DispatchQueue.main.async {
            self.presenter?.loadCalendarToCollection()
        }
        
    }
    override func viewWillLayoutSubviews() {
        moveInitialCollection()
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
    
    func moveInitialCollection() {
        
        guard let initialOffset = homeView.calendarCollectionView.getInitialOffset() else { return }
        homeView.calendarCollectionView.contentOffset.x = initialOffset
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
    
    func addTapCardCycleEventObservable() {
        
        let tapGesture = UITapGestureRecognizer()
        homeView.cardCycle.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind(onNext: { _ in
            guard let currentIndex = try? self.cardPhaseDataSource.index.value() else { return }
            self.presenter?.userTappedCardPhase(at: currentIndex)
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
                var activities = activitiesValue.month
                if activity == .week {
                    activities = activitiesValue.week
                }
                self.activitiesDataSource.activities.onNext(activities)
            })
            .disposed(by: disposeBag)
    }
    
    func addSegmentedControlDataSourceEventObservable(){
        activitiesDataSource.activities.bind(to: homeView.activities
            .rx.items(cellIdentifier: ActivityCell.IDENTIFIER,
                      cellType: ActivityCell.self)){ _, activity, cell in
            cell.draw(activity)
        }.disposed(by: disposeBag)
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
}


extension HomeViewController: PresenterToViewHomeProtocol {
    
    func moveTo(_ month: Date) {
        self.homeView.monthChanged(to: month)
    }

    func load(collectionDataSource: [CyclePhaseViewModel]) {
        datasource.data.onNext(collectionDataSource)
        self.datasource.cyclePhase.onNext(collectionDataSource[HomeCollection.COLLECTION_RANGE/2].phase)
    }
    
    func loadActivity(dataSource: ActivityEventMonthWeek) {
        let newDataSouceMonth = dataSource.month.map { event in
            return ActivityCellViewModel(title: event.title, hourStart: event.startDate.formattHour(), hourEnd: event.endDate.formattHour(), day: event.startDate, phase: event.phase)
        }
        let newDataSouceWeek = dataSource.week.map { event in
            return ActivityCellViewModel(title: event.title, hourStart: event.startDate.formattHour(), hourEnd: event.endDate.formattHour(), day: event.startDate, phase: event.phase)
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
                presenter?.loadCalendarToCollection()
                
                let phase = selectedCell.getPhase()
                
                if phase != .menstruation {
                    showFeedbackRegisterMenstruation()
                }
            }
            else {
                // MUDAR ALERTA, MUDAR TEXTO
                let alert = UIAlertController(title: "Aviso",
                                              message: "Você não pode marcar um dia próximo a outra menstruação",
                                              preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: { _ in
                }))

                present(alert, animated: true, completion: nil)
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
        presenter?.loadUserCalendar()
        DispatchQueue.main.async {
            self.homeView.userAllowedAccessCalendar()
        }
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
}




