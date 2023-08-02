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
    
    private let days: Observable<[CyclePhaseViewModel]>
    private var datasource: CalendarCollectionViewDataSource
    
    private let proxy: CalendarCollectionViewDelegateProxy
    
    init(datasource: CalendarCollectionViewDataSource, proxy: CalendarCollectionViewDelegateProxy ){
        self.proxy = proxy
        self.datasource = datasource
        self.days = Observable.of(datasource.data)
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        homeView.calendarCollectionView.setMargin(with: self.view.frame.width)
    }
    
    private func addCollectionViewDataSource(){
        
        days.bind(to: homeView.calendarCollectionView
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
}


extension HomeViewController: PresenterToViewHomeProtocol {

    // TODO: Implement View Output Methods
    
    
    func moveCalendarCollection(toXAxis: CGFloat) {
        self.datasource.lastCell?.transformToStandard()
        self.homeView.calendarCollectionView.contentOffset.x = toXAxis
    }
    
    func changeSelectedCell() {
        
    }
    
    
    func userAllowedAccessCalendar() {
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



