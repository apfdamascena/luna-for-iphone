//
//  CalendarCollectionViewDataSource.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation

protocol CalendarCollectionViewDataSource {
    var data: [CyclePhaseViewModel] { get }
    var lastCell: CalendarCollectionViewCell? { get set }
}
