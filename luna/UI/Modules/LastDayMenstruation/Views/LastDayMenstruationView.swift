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
    
    private(set) lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = .current
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.tintColor = .black
        return picker
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
    }
    
    func addConstraints() {
        
        stack.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        title.snp.makeConstraints{
            $0.height.equalTo(10.su)
        }
        
        datePickerContainer.snp.makeConstraints{
            $0.height.equalTo(40.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}
