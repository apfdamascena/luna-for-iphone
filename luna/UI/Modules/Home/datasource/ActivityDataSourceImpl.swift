//
//  ActivityDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 13/09/23.
//

import Foundation
import RxSwift

class ActivityDataSourceImpl: ActivityDataSource {
    
    var activities: BehaviorSubject<[String]> = BehaviorSubject(value: ["testando", "testando", "testando", "testando", "testando"])
}
