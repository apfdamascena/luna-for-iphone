//
//  MenstruationDurationView.swift
//  luna
//
//  Created by sml on 21/07/23.
//

import UIKit
import SnapKit

class MenstruationDurationView: UIView, AnyView {
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        return view
    }()
            
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 31,
                                      color: .black,
                                      weight: .regular)
        
        label.text = L10n.Constants.Content.Label.menstruationDuration
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    
    private let pickerContainer = UIView()
        
    private(set) var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .red
        return picker
    }()
    
    private(set) var label: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 31,
                                      color: .black,
                                      weight: .regular)
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
        background.addSubview(stack)
        
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(pickerContainer)


        pickerContainer.addSubview(picker)
    }
    
    func addConstraints() {
        
        background.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        
        stack.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        title.snp.makeConstraints{
            $0.height.equalTo(10.su)
        }
        
        pickerContainer.snp.makeConstraints{
            $0.height.equalTo(40.su)
        }
        
        picker.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(10.su)
            $0.trailing.equalToSuperview().offset(-10.su)
        }
    }
    
    func addAdditionalConfiguration() {
        pickerContainer.backgroundColor = .blue
    }
    
}
