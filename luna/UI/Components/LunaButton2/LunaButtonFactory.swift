//
//  LunaButtonFactory.swift
//  luna
//
//  Created by Cynara Costa on 27/07/23.
//

import UIKit

class LunaButtonFactory {
    static func create(button: UIButton, lunaStyle: LunaButtonStyle) -> DrawableButton {
        switch lunaStyle{
        case .initial:
            return LunaButtonProceed(myButton: button, style: lunaStyle)
        case .previous:
            return LunaButtonBack(myButton: button)
        case .next:
            return LunaButtonProceed(myButton: button, style: lunaStyle)
        }
    }
}
