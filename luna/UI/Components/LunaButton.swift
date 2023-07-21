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
    let text: String
    
}

class LunaButton: UIButton, AnyView, DrawableView {

    typealias ViewModel = LunaButtonViewModel

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw(_ model: LunaButtonViewModel) {
        configuration?.background.backgroundColor = .black
        configuration?.title = model.text
    }
    
    func addAdditionalConfiguration() {
        layer.cornerRadius = 8
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20)
        self.configuration = configuration
    }
    
}
