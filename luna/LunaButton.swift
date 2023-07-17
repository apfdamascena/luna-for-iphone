//
//  LunaButton.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit

enum LunaButtonStyle {
    
    case rounded
    case normal
}

struct LunaButtonViewModel {
    
    let style: LunaButtonStyle
    let textColor: UIColor
    
}

class LunaButton: UIButton, AnyView, DrawableView {

    typealias ViewModel = LunaButtonViewModel

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw(_ model: LunaButtonViewModel) {
        backgroundColor = .purple
    }
    
}
