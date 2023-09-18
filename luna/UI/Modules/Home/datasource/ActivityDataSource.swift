//
//  ActivityDatasource.swift
//  luna
//
//  Created by alexdamascena on 13/09/23.
//

import RxSwift

protocol ActivityDataSource {
    
    var activities: BehaviorSubject<[ActivityEvent]> { get }
    var activitiesForSegmentedControl: BehaviorSubject<[ActivityEvent]> { get }

}
