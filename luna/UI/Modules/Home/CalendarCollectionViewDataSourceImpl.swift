//
//  CalendarCollectionViewDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation
import RxSwift


class CalendarCollectionViewDataSourceImpl: CalendarCollectionViewDataSource {
    
    var data: [CyclePhaseViewModel] = [CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantPast, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .now, focus: .selected),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .luteal, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .menstruation, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .pms, day: .distantFuture, focus: .normal),CyclePhaseViewModel(phase: .fertile, day: .distantFuture, focus: .normal)]
    
    var lastCell: CalendarCollectionViewCell?
    
    var cyclePhase: PublishSubject<CyclePhase> = PublishSubject()
    
}
