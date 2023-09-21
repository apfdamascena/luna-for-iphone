//
//  CreateEventView.swift
//  luna
//
//  Created by sml on 20/09/23.
//

import UIKit
import SnapKit

class CreateEventView: UIView, AnyView {
    
    private let activityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: L10n.Constants.Content.Label.NewActivity.AddNewActivity.placeholderActivityTitle,
            attributes: [NSAttributedString.Key.foregroundColor: Asset.gray400.color])
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.cornerRadius = 1.su
        textField.setLeftPaddingPoints(2.su)
        textField.textColor = .black
        textField.backgroundColor = Asset.gray50.color
        
        return textField
    }()
    
    var createEventButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .scheduleActivity)
        return button
    }()
    
    private let nameLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.gray400.color,
                                      weight: .regular)
        label.text = "NOME"
        label.draw(model)
        label.addLineHeight(of: 16)
        return label
    }()
    
    private let dateLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.gray400.color,
                                      weight: .regular)
        label.text = "DATA"
        label.draw(model)
        label.addLineHeight(of: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
       
    }
    
    func addConstraints() {
      
        
    }
    
    func addAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
}


