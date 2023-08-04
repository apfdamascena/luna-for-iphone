//
//  Onboarding.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//

import Foundation

struct Onboarding {
    static let NUMBER_PAGES = 6
    static let NUMBER_PAGES_0_BASE = Onboarding.NUMBER_PAGES - 1
    static let MENSTRUATION_DURATION_RANGE = 1...20
    static let CYCLE_DURATION_RANGE = 10...40
    static let CYCLE_DURATION_QUANTITY = CYCLE_DURATION_RANGE.upperBound - CYCLE_DURATION_RANGE.lowerBound
    static let MENSTRUATION_DURATION_QUANTITY = CYCLE_DURATION_RANGE.upperBound - CYCLE_DURATION_RANGE.lowerBound
    static let INFINITE_PICKER_SIZE = 10000


}
