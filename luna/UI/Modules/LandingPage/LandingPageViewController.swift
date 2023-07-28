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


class LandingPageViewController: UIViewController {
    
    func addDataSourceEventObservable() {

        landingPageView.collectionView.rx.didScroll.asObservable()
            .subscribe { _ in
                self.scrollViewDidScroll(self.landingPageView.collectionView)
            }.disposed(by: disposeBag)
        
    }
    
    var presenter: ViewToPresenterLandingPageProtocol?
    
    let landingPageView = LandingPageView()
    
    private var disposeBag = DisposeBag()
    
    let days = Observable.of([CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .luteal, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .now, focus: .selected),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .luteal, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .none, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .ovulacao, day: .distantFuture, focus: .normal)])
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = landingPageView
        
        addUserTouchTrigger()
        addCollectionViewDataSource()
        addDataSourceEventObservable()
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

            centerCell?.transformToLarge()
        }

        if let cell = centerCell {
            let offsetX = centerPoint.x - cell.center.x

            if offsetX < -16 || offsetX > 16 {
                cell.transformToStandard()
                centerCell = nil
            }
        }
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



