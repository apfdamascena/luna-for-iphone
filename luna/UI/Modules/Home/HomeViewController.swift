//
//  HomeViewController.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import UIKit


protocol CollectionViewDataSource {
    var elements: [CyclePhaseViewModel] { get }
}

var lastCell: CalendarCollectionViewCell? = nil


class HomeViewController: UIViewController {
    
    var presenter: ViewToPresenterHomeProtocol?
    
    private let homeView = HomeView()
    
    private var disposeBag = DisposeBag()
    
    let days = Observable.of([CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .now, focus: .selected),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .luteal, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal)])
    
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
        
        let layoutMargins: CGFloat = homeView.calendarCollectionView.layoutMargins.left + homeView.calendarCollectionView.layoutMargins.right
        
        let sideInset = (self.view.frame.width / 2) - layoutMargins
        homeView.calendarCollectionView.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    private func addCollectionViewDataSource(){
        
        days.bind(to: homeView.calendarCollectionView
            .rx.items(cellIdentifier: CalendarCollectionViewCell.IDENTIFIER,
                      cellType: CalendarCollectionViewCell.self)){ _, day, cell in
            
            cell.draw(day)
        }.disposed(by: disposeBag)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }

        let centerPoint = CGPoint(x: homeView.calendarCollectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                                  y: homeView.calendarCollectionView.frame.size.height / 2 + scrollView.contentOffset.y)

        var centerCell: CalendarCollectionViewCell?
        
        
        if let indexPath = homeView.calendarCollectionView.indexPathForItem(at: centerPoint) {
            centerCell = (homeView.calendarCollectionView.cellForItem(at: indexPath) as! CalendarCollectionViewCell)
            
            lastCell?.transformToStandard()
            
            lastCell = centerCell
            
            centerCell?.transformToLarge()
        }
        
//        if let cell = centerCell {
//
//            let offsetX = centerPoint.x - cell.center.x
//
//            if offsetX < -15 || offsetX > 15 {
//                cell.transformToStandard()
//                centerCell = nil
//            }
//        }
    }
    
    func collectionViewEventObservable() {

        homeView.calendarCollectionView.rx.didScroll.asObservable()
            .subscribe { _ in
                self.scrollViewDidScroll(self.homeView.calendarCollectionView)
            }.disposed(by: disposeBag)
        
        homeView.calendarCollectionView.rx.itemSelected.subscribe(onNext: { indexPath in
            
            let selectedCell = (self.homeView.calendarCollectionView.cellForItem(at: indexPath) as! CalendarCollectionViewCell)
            
            let centerPoint = CGPoint(x: self.homeView.calendarCollectionView.frame.size.width / 2 + self.homeView.calendarCollectionView.contentOffset.x,
                                      y: self.homeView.calendarCollectionView.frame.size.height / 2 + self.homeView.calendarCollectionView.contentOffset.y)
            
            let centerIndex = self.homeView.calendarCollectionView.indexPathForItem(at: centerPoint)
            let centerCell = (self.homeView.calendarCollectionView.cellForItem(at: centerIndex!) as! CalendarCollectionViewCell)
            
            
            let centerXtoCollection = (selectedCell.center.x) - 5.5 - self.homeView.calendarCollectionView.frame.size.width / 2
            
            if centerCell == selectedCell {
                
                //Altera Fase
//                print((selectedCell.center.x) - 5.5 - self.landingPageView.collectionView.frame.size.width / 2)
//                print(selectedCell.center.x)
//                print(self.landingPageView.collectionView.frame.size.width / 2)
                
            }
            else {
//                print((selectedCell.center.x) - 5.5 - self.landingPageView.collectionView.frame.size.width / 2)
//                print(selectedCell.center.x)
                lastCell?.transformToStandard()
                self.homeView.calendarCollectionView.contentOffset.x = centerXtoCollection
            }
        }).disposed(by: disposeBag)
//        print("texte")
//        print(landingPageView.collectionView.contentOffset.x)
//
//        print(landingPageView.collectionView.frame.size.width / 2)
//        let offInitial = (21.5 + 0*53) - 5.5 - landingPageView.collectionView.frame.size.width / 2
//
//        print(offInitial)
//        landingPageView.collectionView.contentOffset.x = 300
        
    }
}

extension HomeViewController: PresenterToViewHomeProtocol{
    
    func userAllowedAccessCalendar() {
//        DispatchQueue.main.async {
//            self.view.backgroundColor = .yellow
//            self.presenter?.loadUserCalendar()
//        }

    }
    
    func userDeniedAccessCalendar() {
//        DispatchQueue.main.async {
//            self.view.backgroundColor = .green
//        }
    }
    
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI
import RxSwift

@available(iOS 13, *)
struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewController().showPreview()
    }
}

#endif



