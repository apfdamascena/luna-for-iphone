//
//  LunaButtonText.swift
//  luna
//
//  Created by alexdamascena on 28/09/23.
//

import UIKit

class LunaButtonText: DrawableButton {
    
    let button: UIButton
    
    init(_ button: UIButton) {
        self.button = button
    }
    
    func draw() {
        
        var configuration = UIButton.Configuration.plain()
        
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        container.foregroundColor = Asset.red600.color
        
        configuration.attributedTitle = AttributedString(L10n.Constants.Content.Button.backToHome, attributes: container)
        configuration.baseForegroundColor = Asset.red600.color

        configuration.background.backgroundColor = .clear
        
        self.button.configuration = configuration
        
    }
}
