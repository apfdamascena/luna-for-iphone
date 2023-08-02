//
//  CalendarCollectionViewDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation
import RxSwift

class CalendarCollectionViewDataSourceImpl: CalendarCollectionViewDataSource {
    var data: PublishSubject<[CyclePhaseViewModel]> = PublishSubject()

    var lastCell: CalendarCollectionViewCell?
    
}
