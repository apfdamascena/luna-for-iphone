//
//  ActivityFilter.swift
//  luna
//
//  Created by alexdamascena on 14/09/23.
//

import Foundation

struct ActivityEventMonthWeek {
    let week: [ActivityEvent]
    let month: [ActivityEvent]
}

struct ActivityFilter {
    let week: [ActivityCellViewModel]
    let month: [ActivityCellViewModel]
}
