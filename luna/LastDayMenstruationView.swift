//
//  LastDayMenstruationView.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit
import SnapKit


class LastDayMenstruationView: UIView, AnyView  {
    
    private let background: UIImageView = {
        let image = UIImage(named: "background")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 40
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 28,
                                      color: .red,
                                      weight: .heavy)
        
        label.text = "Quando foi o início da sua última menstruação?"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.draw(model)
        return label
    }()
    
    private(set) var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = .current
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .compact
        picker.tintColor = .green
        return picker
    }()
    
    private let nextButtonContainer = UIView()
    
    private(set) var nextButton: LunaButton = {
        let label = LunaButton()
        let model = LunaButtonViewModel(style: .normal,
                                        textColor: .white,
                                        text: "Continuar")
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
        addSubview(background)
        addSubview(stack)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(datePicker)
        stack.addArrangedSubview(nextButtonContainer)
        
        nextButtonContainer.addSubview(nextButton)
    }
    
    func addConstraints() {
        
        background.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        stack.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview().inset(3.su)
        }
        
        nextButtonContainer.snp.makeConstraints{
            $0.height.equalTo(5.su)
        }
        
        nextButton.snp.makeConstraints{
            $0.centerX.height.equalToSuperview()
            $0.width.equalTo(16.su)
        }
    }
    
    func addAdditionalConfiguration() {
        layer.cornerRadius = 64
    }

}
