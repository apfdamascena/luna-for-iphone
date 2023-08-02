//
//  File.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit

enum LineComponent {
    case blue
    case red
    
    var image: UIImage {
        switch self {
        case .blue:
            return Asset.blueLine.image
        case .red:
            return Asset.redLine.image
        }
    }
    
}
