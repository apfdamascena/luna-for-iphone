//
//  ActivityStack.swift
//  luna
//
//  Created by Cynara Costa on 13/09/23.
//

import UIKit
import SnapKit

class ActivityStack: UIStackView, AnyView {
    
    private let activityTitle = NewActivityTitleStackView(
        frame: CGRect(),
        titleText: L10n.Constants.Content.Label.NewActivity.AddNewActivity.activityTitle,
        iconAsset: Asset.pencilIcon
    )
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addArrangedSubview(activityTitle)
        addArrangedSubview(activityTextField)
    }
    
    func addConstraints() {
        activityTextField.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(6.su)
        }
    }
    
    func addAdditionalConfiguration() {
        axis = .vertical
        alignment = .leading
        spacing = 2.su
    }
    
}
