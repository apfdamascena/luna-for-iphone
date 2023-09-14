//
//  ActivityDatasource.swift
//  luna
//
//  Created by alexdamascena on 13/09/23.
//

import RxSwift

protocol ActivityDataSource {
    
    var activities: BehaviorSubject<[String]> { get }
    var activitiesForSegmentedControl: BehaviorSubject<[String]> { get }

}
