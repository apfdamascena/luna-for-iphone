//
//  File.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit

enum BallComponent {
    case blue
    case red
    
    var image: UIImage {
        switch self {
        case .blue:
            return Asset.blueBall.image
        case .red:
            return Asset.ball.image
        }
    }
    
}
