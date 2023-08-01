//
//  Double+Su.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//

import Foundation

extension Double {
    
    var su: CGFloat {
        convertToSu(dimensionSize: CGFloat(self))
    }
    
    private func convertToSu(dimensionSize: CGFloat) -> CGFloat {
        return CGFloat(8 * dimensionSize)
    }
}
