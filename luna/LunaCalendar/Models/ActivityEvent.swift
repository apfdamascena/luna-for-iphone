//
//  ActivityEvent.swift
//  luna
//
//  Created by gabrielfelipo on 04/09/23.
//

import Foundation

struct ActivityEvent {
    let title: String
    let startDate: Date
    let endDate: Date
    var phase: CyclePhase = .none
}
