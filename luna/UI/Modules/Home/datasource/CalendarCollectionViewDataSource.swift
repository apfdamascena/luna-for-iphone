//
//  CalendarCollectionViewDataSource.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation
import RxSwift

protocol CalendarCollectionViewDataSource {
    
    var data: PublishSubject<[CyclePhaseViewModel]> { get }
    var lastCell: CalendarCollectionViewCell? { get set }
    var cyclePhase: BehaviorSubject<CyclePhase> { get }
    var month: PublishSubject<Date> { get }
    var accessToCalendar: BehaviorSubject<CalendarAccess> { get }
}
