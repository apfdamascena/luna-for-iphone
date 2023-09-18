//
//  ActivityFilter.swift
//  luna
//
//  Created by alexdamascena on 14/09/23.
//

import Foundation


protocol ActivityFilter {
    
    func filter(_ data: [ActivityCellViewModel] ) -> [ActivityCellViewModel]
}
