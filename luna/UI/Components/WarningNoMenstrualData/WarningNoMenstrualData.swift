//
//  WarningNoMenstrualData.swift
//  luna
//
//  Created by alexdamascena on 04/08/23.
//

import UIKit

class WarningNoMenstrualData: UIView, AnyView {
    
    private let informationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20,
                                      color: .black,
                                      weight: .semibold)
        label.text = "Nesta dia, ainda não tínhamos os seus dados"
        label.draw(model)
        label.numberOfLines = 0
        return label
    }()
    
    private let subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        label.draw(model)
        label.text = "Explore os dias futuros!"
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
        addSubview(informationStack)
        
        informationStack.addArrangedSubview(title)
        informationStack.addArrangedSubview(subtitle)
        
    }
    
    func addConstraints() {
        
        informationStack.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalToSuperview().offset(4.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = Asset.gray100.color
        layer.cornerRadius = 8
    }
}
