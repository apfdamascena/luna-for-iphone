//
//  LunaButtonBack.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit

class LunaButtonNewEvent: DrawableButton {
    
    let button: UIButton
    
    init(_ button: UIButton) {
        self.button = button
    }
    
    func draw() {
        
        var configuration = UIButton.Configuration.plain()
        
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        container.foregroundColor = Asset.red600.color
        
        configuration.attributedTitle = AttributedString(L10n.Constants.Content.Button.newEvent, attributes: container)
        configuration.baseForegroundColor = Asset.red600.color
        
        configuration.image = Asset.plusIcon.image
        configuration.imagePadding = 1.su
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 1.su, leading: (1.2).su, bottom: 1.su, trailing: (11).su)

        
        configuration.background.backgroundColor = .clear
        
        self.button.configuration = configuration
        
    }
}
