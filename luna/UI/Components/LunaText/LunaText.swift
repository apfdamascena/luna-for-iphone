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
    
    func attributedTextBold(withString string: String, boldString: String, model: LunaTextViewModel) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: model.size,
                                     weight: model.weight)
        let attributedString = NSMutableAttributedString(string: string,
                                                     attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
}

