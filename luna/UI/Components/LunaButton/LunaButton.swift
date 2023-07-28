//
//  LunaButton2.swift
//  luna
//
//  Created by Cynara Costa on 27/07/23.
//

import UIKit

class LunaButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw(style: LunaButtonStyle) {
        let newButton = LunaButtonFactory.create(button: self, lunaStyle: style)
        newButton.draw()
    }
    
}

class LunaButtonProceed: DrawableButton {
    
    let button: UIButton
    let style: LunaButtonStyle
    
    init(currentButton: UIButton, style: LunaButtonStyle) {
        self.button = currentButton
        self.style = style
    }
    
    func draw() {
        self.button.setTitle(style.value, for: .normal)
        self.button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.button.titleLabel?.textColor = .white
        self.button.backgroundColor = Asset.primaryRed900.color
        self.button.layer.cornerRadius = 1.su
        self.button.clipsToBounds = true
    }
}

class LunaButtonBack: DrawableButton {
    
    let button: UIButton
    
    init(currentButton: UIButton) {
        self.button = currentButton
    }
    
    func draw() {
        self.button.setTitle(L10n.Constants.Content.Button.previous, for: .normal)
        self.button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.button.setTitleColor(Asset.primaryRed900.color, for: .normal)
        self.button.backgroundColor = .clear
        self.button.setImage(Asset.arrowLeftIcon.image, for: .normal)
        self.button.configuration?.imagePlacement = .leading
        self.button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2.su)
        self.button.contentEdgeInsets = UIEdgeInsets(top: 1.su, left: (1.2).su, bottom: 1.su, right: (1.2).su)
    }
}



