//
//  Int+DynamicFontSize.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//

import UIKit

extension Int {
    
    var dynamicFontSize: CGFloat {
        let screenWidth = UIScreen.current?.bounds.width
        let proportion = Int(screenWidth ?? 0) / Device.iPhone14.width
        return CGFloat(self) * CGFloat(proportion)
    }
}
