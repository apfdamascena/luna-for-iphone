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
        view.backgroundColor = .red
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
        let viewModel = LunaTextViewModel(size: 28,
                                          color: .black,
                                          weight: .heavy)
        label.text = L10n.Constants.Content.Label.menstruationDuration
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(viewModel)
        return label
    }()
    
    private let pickerContainer = UIView()
        
    private(set) var picker: UIPickerView = {
        let picker = UIPickerView()
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
        addSubview(background)
        background.addSubview(stack)
        
        stack.addArrangedSubview(pickerContainer)
        stack.addArrangedSubview(title)

        pickerContainer.addSubview(picker)
    }
    
    func addConstraints() {
        
        background.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        
        stack.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(3.su)
            $0.trailing.equalToSuperview().offset(-3.su)

        }
        
        title.snp.makeConstraints{
            $0.height.equalToSuperview().offset(10.su)
        }
        
        pickerContainer.snp.makeConstraints{
            $0.height.equalToSuperview().offset(10.su)
        }
        
        picker.snp.makeConstraints{
            $0.height.width.equalToSuperview()
            
        }
    }
    
    func addAdditionalConfiguration() {
        pickerContainer.backgroundColor = .blue
    }
    
}
