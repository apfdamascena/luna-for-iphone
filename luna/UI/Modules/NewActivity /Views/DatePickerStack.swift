//
//  DatePickerStack.swift
//  luna
//
//  Created by Cynara Costa on 13/09/23.
//

import UIKit
import SnapKit

class DatePickerStack: UIStackView, AnyView {
    
    private let dateTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17, color: Asset.gray950.color, weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.AddNewActivity.dateTitle
        label.addLineHeight(of: 24)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = Asset.red500.color
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        datePicker.minimumDate = Date()
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addArrangedSubview(dateTitle)
        addArrangedSubview(datePicker)
    }
    
    func addConstraints() {
        dateTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2.su)
        }
        
        datePicker.subviews[0].subviews[0].snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-1.su)
        }
    }
    
    func addAdditionalConfiguration() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillEqually
        self.backgroundColor = Asset.gray50.color
        self.layer.cornerRadius = 1.su
    }
    
}
