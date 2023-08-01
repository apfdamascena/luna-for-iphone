//
//  LunaButtonProceed.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit

class LunaButtonProceed: DrawableButton {
    
    let button: UIButton
    let style: LunaButtonStyle
    
    init(_ button: UIButton, style: LunaButtonStyle) {
        self.button = button
        self.style = style
    }
    
    func draw() {
        
        var configuration = UIButton.Configuration.plain()
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        container.foregroundColor = .white
        
        configuration.attributedTitle = AttributedString(style.value, attributes: container)
        configuration.baseForegroundColor = .white
        
        configuration.background.backgroundColor = Asset.primaryRed900.color
        
        self.button.configuration = configuration
    }
    
    func addAdditionalConfiguration() {
        self.button.layer.cornerRadius = 1.su
        self.button.clipsToBounds = true
    }
    
}
