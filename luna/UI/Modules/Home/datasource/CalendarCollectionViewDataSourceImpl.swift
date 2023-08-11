//
//  CalendarCollectionViewDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation
import RxSwift


class CalendarCollectionViewDataSourceImpl: CalendarCollectionViewDataSource {
    
    var accessToCalendar: BehaviorSubject<CalendarAccess> = BehaviorSubject(value: .unauthorized)
    
    var data: PublishSubject<[CyclePhaseViewModel]> = PublishSubject()

    var lastCell: CalendarCollectionViewCell?
    
    var cyclePhase: PublishSubject<CyclePhase> = PublishSubject()
    
    var month: PublishSubject<Date> = PublishSubject()
    
}
