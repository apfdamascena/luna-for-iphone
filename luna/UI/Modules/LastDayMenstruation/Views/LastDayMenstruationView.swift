//
//  LastDayMenstruationView.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit
import SnapKit


class LastDayMenstruationView: UIView, AnyView  {
    
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 31,
                                      color: .black,
                                      weight: .regular)
        
        label.text = L10n.Constants.Content.Label.lastDayMenstruation
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let datePickerContainer = UIView()
    
    private(set) var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = .current
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.tintColor = .red
        return picker
    }()
    
    private(set) var nextButton: LunaButton = {
        let label = LunaButton()
        let model = LunaButtonViewModel(style: .normal,
                                        textColor: .white,
                                        text: L10n.Constants.Content.Button.continue)
        label.draw(model)
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
        addSubview(stack)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(datePickerContainer)
        
        datePickerContainer.addSubview(datePicker)
        addSubview(nextButton)
    }
    
    func addConstraints() {
        
        stack.backgroundColor = .yellow

        stack.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-6.su)
            $0.width.equalToSuperview().inset(3.su)
        }
        
        datePickerContainer.snp.makeConstraints{
            $0.height.equalTo(4.su)
        }
    
        nextButton.snp.makeConstraints{
            $0.top.equalTo(stack.snp.bottom).offset(5.su)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(16.su)
            $0.height.equalTo(5.su)
        }
        
        datePicker.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}
