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
    
    init(datasource: CalendarCollectionViewDataSource){
        self.datasource = datasource
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
        seeMoreButtonTouchTrigger()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        DispatchQueue.main.async {
            self.presenter?.loadCalendarToCollection()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        homeView.calendarCollectionView.setMargin(with: self.view.frame.width)
        
        moveInitialCollection()
        DispatchQueue.main.async {
            self.presenter?.loadCalendarToCollection()
        }
    }
    
    private func addCollectionViewDataSource(){
        
        datasource.data.bind(to: homeView.calendarCollectionView
            .rx.items(cellIdentifier: CalendarCollectionViewCell.IDENTIFIER,
                      cellType: CalendarCollectionViewCell.self)){ _, day, cell in
            cell.draw(day)
        }.disposed(by: disposeBag)
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
                self.presenter?.userSelect(selectedCell, center: centerCell,
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
        }).disposed(by: disposeBag)
    }
    
    func addSettingsHandlerEvent(){
        
        homeView
            .warningCalendarAccess
            .settingsButton.rx.tap.bind {
                self.presenter?.userOpenDeviceSettings()
            }.disposed(by: disposeBag)
    }

    
    func seeMoreButtonTouchTrigger() {
        
        homeView.menstrualPhaseBehaviorsView
            .seeMoreButton.rx
            .tap.bind {
                self.presenter?.showCyclePhaseReferencesSheet()
            }.disposed(by: disposeBag)
    }
}


extension HomeViewController: PresenterToViewHomeProtocol {
    
    func moveTo(_ month: Date) {
        self.homeView.monthChanged(to: month)
    }
    
    func loadCalendarToCollection(date: Date) {
        
    }

    func load(collectionDataSource: [CyclePhaseViewModel]) {
        datasource.data.onNext(collectionDataSource)
        self.datasource.cyclePhase.onNext(collectionDataSource[HomeCollection.COLLECTION_RANGE/2].phase)
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
         DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
             self.homeView.cardFeedbackDisappear()
         }
    }
    
    func updateView(_ center: CalendarCollectionViewCell) {
        
        DispatchQueue.main.async {
            self.datasource.lastCell?.transformToStandard()
            self.datasource.lastCell = center
            center.transformToLarge()
        }
    }
 
}



