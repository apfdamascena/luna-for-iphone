//
//  LunaText.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit


class LunaText: UILabel, AnyView, DrawableView {

    
    typealias ViewModel = LunaTextViewModel
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func draw(_ model: LunaTextViewModel) {
        textColor = model.color
        font = UIFont.systemFont(ofSize: model.size,
                                      weight: model.weight)
    }
    
    func addLineHeight(of heigth: Int) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(heigth/10)
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle
        ]
        guard let text = self.text else { return }
        let attibrutedText = NSAttributedString(string: text, attributes: attributes)
        
        self.attributedText = attibrutedText
    }
    
}

