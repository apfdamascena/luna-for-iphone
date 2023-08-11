//
//  LunaButtonBack.swift
//  luna
//
//  Created by Cynara Costa on 08/08/23.
//

import UIKit

class LunaButtonSeeMore: DrawableButton {
    
    let button: UIButton
    
    init(_ button: UIButton) {
        self.button = button
    }
    
    func draw() {
        
        var configuration = UIButton.Configuration.plain()
        
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        container.foregroundColor = Asset.primaryRed900.color
        
        configuration.attributedTitle = AttributedString(L10n.Constants.Content.Button.seeMore, attributes: container)
        configuration.baseForegroundColor = Asset.primaryRed900.color
        
        configuration.image = Asset.arrowLeftIcon.image.withHorizontallyFlippedOrientation()
        configuration.imagePadding = 1.su
        configuration.imagePlacement = .trailing
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                              leading: 0,
                                                              bottom: 0,
                                                              trailing: 0)

        configuration.background.backgroundColor = .clear
        
        button.semanticContentAttribute = .forceLeftToRight
        button.contentHorizontalAlignment = .leading
        self.button.configuration = configuration
        
    }
}
