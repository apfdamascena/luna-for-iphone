//
//  LandingPageViewController.swift
//  luna
//
//  Created by gabrielfelipo on 21/07/23.
//  
//

import UIKit
import RxSwift
import RxCocoa

protocol CollectionViewDataSource {
    var elements: [CyclePhaseViewModel] { get }
}

var lastCell:CalendarCollectionViewCell? = nil

class LandingPageViewController: UIViewController, UICollectionViewDelegate {
    
    func collectionViewEventObservable() {

        landingPageView.collectionView.rx.didScroll.asObservable()
            .subscribe { _ in
                self.scrollViewDidScroll(self.landingPageView.collectionView)
            }.disposed(by: disposeBag)
        
        landingPageView.collectionView.rx.itemSelected.subscribe(onNext:{ indexPath in
            
            let selectedCell = (self.landingPageView.collectionView.cellForItem(at: indexPath) as! CalendarCollectionViewCell)
            
            let centerPoint = CGPoint(x: self.landingPageView.collectionView.frame.size.width / 2 + self.landingPageView.collectionView.contentOffset.x,
                                      y: self.landingPageView.collectionView.frame.size.height / 2 + self.landingPageView.collectionView.contentOffset.y)
            
            var centerIndex = self.landingPageView.collectionView.indexPathForItem(at: centerPoint)
            let centerCell = (self.landingPageView.collectionView.cellForItem(at: centerIndex!) as! CalendarCollectionViewCell)
            
            
            var centerXtoCollection = (selectedCell.center.x) - 5.5 - self.landingPageView.collectionView.frame.size.width / 2
            
            if centerCell == selectedCell {
                
                //Altera Fase
                print((selectedCell.center.x) - 5.5 - self.landingPageView.collectionView.frame.size.width / 2)
                print(selectedCell.center.x)
                print(self.landingPageView.collectionView.frame.size.width / 2)
                
            }
            else {
                print((selectedCell.center.x) - 5.5 - self.landingPageView.collectionView.frame.size.width / 2)
                print(selectedCell.center.x)
                lastCell?.transformToStandard()
                self.landingPageView.collectionView.contentOffset.x = centerXtoCollection
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
    
    
    
    var presenter: ViewToPresenterLandingPageProtocol?
    
    let landingPageView = LandingPageView()
    
    private var disposeBag = DisposeBag()
    
    let days = Observable.of([CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .now, focus: .selected),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .luteal, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal)])
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = landingPageView
        
        addUserTouchTrigger()
        addCollectionViewDataSource()
        collectionViewEventObservable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let layoutMargins: CGFloat = landingPageView.collectionView.layoutMargins.left + landingPageView.collectionView.layoutMargins.right
        
        let sideInset = (self.view.frame.width / 2) - layoutMargins
        landingPageView.collectionView.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    private func addCollectionViewDataSource(){
        
        days.bind(to: landingPageView.collectionView
            .rx.items(cellIdentifier: CalendarCollectionViewCell.IDENTIFIER,
                      cellType: CalendarCollectionViewCell.self)){ _, day, cell in
            
            cell.draw(day)
        }.disposed(by: disposeBag)
    }
    
    func addUserTouchTrigger() {
        landingPageView.startButton.rx.tap.bind{
            self.presenter?.userTappedContinue()
        }.disposed(by: disposeBag)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }

        let centerPoint = CGPoint(x: landingPageView.collectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                                  y: landingPageView.collectionView.frame.size.height / 2 + scrollView.contentOffset.y)

        var centerCell: CalendarCollectionViewCell?
        
        
        if let indexPath = landingPageView.collectionView.indexPathForItem(at: centerPoint) {
            centerCell = (landingPageView.collectionView.cellForItem(at: indexPath) as! CalendarCollectionViewCell)
            
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
    
    
}


extension LandingPageViewController: PresenterToViewLandingPageProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct LandingPageViewController_Preview: PreviewProvider {
    static var previews: some View {
        LandingPageViewController().showPreview()
    }
}

#endif



