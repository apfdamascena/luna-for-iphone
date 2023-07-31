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



