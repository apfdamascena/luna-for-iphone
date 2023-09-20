//
//  ActivityDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 13/09/23.
//

import Foundation
import RxSwift


class ActivityDataSourceImpl: ActivityDataSource {
    
    var activities: BehaviorSubject<[ActivityCellViewModel]> = BehaviorSubject(value: [])
    var activitiesForSegmentedControl: BehaviorSubject<ActivityFilter> = BehaviorSubject(value: ActivityFilter(week: [], month: []))
}
