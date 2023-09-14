//
//  CalendarCollectionView+Rx.swift
//  luna
//
//  Created by alexdamascena on 09/08/23.
//

import RxSwift

extension Reactive where Base: CalendarScrollCollectionView {
    
    var selectItemAtCalendar: Observable<(CalendarCollectionViewCell?, CalendarCollectionViewCell?, CGFloat?)> {
        self.base.rx.itemSelected
            .map{ indexPath in
                self.base.getSelectedAndCenterCell(at: indexPath)
            }.asObservable()
    }
    
    var scrollToCenter: Observable<(CalendarCollectionViewCell?, CyclePhase?, Date?)> {
        
        self.base.rx.didScroll
            .map {
                return self.base.scrollViewDidScroll()
            }
            .map { cell in
                return (cell, cell?.getPhase(), cell?.getDate())
            }.asObservable()
    }
}
