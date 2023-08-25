//
//  CardPhaseControl.swift
//  luna
//
//  Created by Cynara Costa on 25/08/23.
//

import UIKit
import RxSwift

protocol CardPhaseControlDataSource {
    var index: BehaviorSubject<Int> { get }
    var cardsPhase: DynamicCardPhaseViewModel { get }
}
