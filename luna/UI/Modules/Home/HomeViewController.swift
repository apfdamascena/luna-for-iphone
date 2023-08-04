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
    
    private let proxy: CalendarCollectionViewDelegateProxy
    
    init(datasource: CalendarCollectionViewDataSource, proxy: CalendarCollectionViewDelegateProxy ){
        self.proxy = proxy
        self.datasource = datasource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        presenter?.checkCalendarPermission()
        addCollectionViewDataSource()
        collectionViewEventObservable()
        addCyclePhaseEventObservable()
        addSettingsHandlerEvent()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        presenter?.loadCalendarToCollection()
//        self.datasource.cyclePhase.onNext(celuladomeio)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        homeView.calendarCollectionView.setMargin(with: self.view.frame.width)
        moveInitialCollection()
    }
    
    private func addCollectionViewDataSource(){
        
        datasource.data.bind(to: homeView.calendarCollectionView
            .rx.items(cellIdentifier: CalendarCollectionViewCell.IDENTIFIER,
                      cellType: CalendarCollectionViewCell.self)){ _, day, cell in
            cell.draw(day)
        }.disposed(by: disposeBag)
        
    }
    
    func collectionViewEventObservable() {
        homeView.calendarCollectionView.rx
            .didScroll.asObservable()
            .subscribe { _ in
                let centerCell = self.proxy.scrollViewDidScroll(self.homeView.calendarCollectionView)
                self.presenter?.change(centerCell)
                guard let centerCellPhase = centerCell?.getPhase() else { return }
                self.datasource.cyclePhase.onNext(centerCellPhase)
                guard let month = centerCell?.getDate() else { return }
                self.homeView.monthChanged(to: month)
            }.disposed(by: disposeBag)
        
        homeView
            .calendarCollectionView
            .rx.itemSelected
            .map { indexPath in
                self.homeView.calendarCollectionView.getSelectedAndCenterCell(at: indexPath)
            }.subscribe { selectedCell, centerCell, centerXtoCollection in
                self.presenter?.userSelect(selectedCell,
                                           center: centerCell,
                                           andMoveCenter: centerXtoCollection)
            }.disposed(by: disposeBag)
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
        }).disposed(by: disposeBag)
    }
    
    func addSettingsHandlerEvent(){
        
        homeView
            .warningCalendarAccess
            .settingsButton.rx.tap.bind {
                self.presenter?.userOpenDeviceSettings()

            }.disposed(by: disposeBag)
    }
}


extension HomeViewController: PresenterToViewHomeProtocol {
    func loadCalendarToCollection(date: Date) {
        
    }

    func load(collectionDataSource: [CyclePhaseViewModel]) {
        datasource.data.onNext(collectionDataSource)
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



