//
//  CreateButton.swift
//  luna
//
//  Created by Cynara Costa on 26/07/23.
//

import UIKit

class CreateButton {
    
    enum ButtonType {
        case back
        case proceed
    }
    
    static func draw(type: ButtonType, frame: CGRect) -> Button {
        switch type {
        case .back:
            return BackButton(frame: frame)
        case .proceed:
            return ProceedButton(frame: frame)
        }
    }
    
}
