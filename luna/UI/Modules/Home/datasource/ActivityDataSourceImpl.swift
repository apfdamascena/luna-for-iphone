//
//  ActivityDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 13/09/23.
//

import Foundation
import RxSwift


class ActivityDataSourceImpl: ActivityDataSource {
    
    var activities: BehaviorSubject<[ActivityCellViewModel]> = BehaviorSubject(value: [
        ActivityCellViewModel(title: "Aniversário de Alana",
                                          hourStart: "10:00",
                                          hourEnd: "12:00",
                                          day: Date(),
                                          phase: .fertile),
        ActivityCellViewModel(title: "Aniversário de Alana",
                                          hourStart: "10:00",
                                          hourEnd: "12:00",
                                          day: Date(),
                                          phase: .fertile),
        ActivityCellViewModel(title: "Aniversário de Alana",
                                          hourStart: "10:00",
                                          hourEnd: "12:00",
                                          day: Date(),
                                          phase: .fertile)
    ])
    var activitiesForSegmentedControl: BehaviorSubject<[ActivityCellViewModel]> = BehaviorSubject(value: [])
}
