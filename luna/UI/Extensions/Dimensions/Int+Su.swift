//
//  Int+Su.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit


extension Int {
    
    var su: CGFloat {
        convertToSu(dimensionSize: CGFloat(self))
    }
    
    private func convertToSu(dimensionSize: CGFloat) -> CGFloat {
        return CGFloat(8 * dimensionSize)
    }
}

extension Double {
    
    var su: CGFloat {
        convertToSu(dimensionSize: CGFloat(self))
    }
    
    private func convertToSu(dimensionSize: CGFloat) -> CGFloat {
        return CGFloat(8 * dimensionSize)
    }
}
