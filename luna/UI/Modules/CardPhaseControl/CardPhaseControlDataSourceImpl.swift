//
//  CardPhaseControlDataSourceImpl.swift
//  luna
//
//  Created by Cynara Costa on 25/08/23.
//

import UIKit
import RxSwift

class CardPhaseControlDataSourceImpl: CardPhaseControlDataSource {
    var index: BehaviorSubject<Int> = BehaviorSubject(value: 0)
}
