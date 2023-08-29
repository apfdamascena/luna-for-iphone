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
            return LunaButtonProceed(button, style: lunaStyle)
        case .previous:
            return LunaButtonBack(button)
        case .next:
            return LunaButtonProceed(button, style: lunaStyle)
        case .settings:
            return LunaButtonProceed(button, style: lunaStyle)
        case .references:
            return LunaButtonReferences(button)
        }
    }
}
