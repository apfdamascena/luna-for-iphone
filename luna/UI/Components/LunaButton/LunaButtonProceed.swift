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
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        container.foregroundColor = .white
        
        configuration.attributedTitle = AttributedString(style.value, attributes: container)
        configuration.baseForegroundColor = .white
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: (1.75).su, leading: (2.5).su, bottom: (1.75).su, trailing: (2.5).su)
        
        configuration.background.backgroundColor = Asset.red600.color
        
        self.button.configuration = configuration
    }
    
    func addAdditionalConfiguration() {
        self.button.layer.cornerRadius = 1.su
        self.button.clipsToBounds = true
    }
    
}
