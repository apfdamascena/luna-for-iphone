//
//  WarningNoMenstrualData.swift
//  luna
//
//  Created by alexdamascena on 04/08/23.
//

import UIKit
import SnapKit

class WarningNoMenstrualData: UIView, AnyView {
    
    private let informationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private let image: UIImageView = {
        let view = UIImageView(image: Asset.imageNoData.image)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25,
                                      color: Asset.gray950.color,
                                      weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.noData
        label.draw(model)
        label.numberOfLines = 0
        label.addLineHeight(of: 31)
        return label
    }()
    
    private let subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17,
                                      color: Asset.gray950.color,
                                      weight: .regular)
        label.draw(model)
        label.numberOfLines = 0
        label.text = L10n.Constants.Content.Label.Home.noDataDescripition
        label.addLineHeight(of: 24)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        isSkeletonable = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(image)
        addSubview(informationStack)
        
        
        informationStack.addArrangedSubview(title)
        informationStack.addArrangedSubview(subtitle)
        
    }
    
    func addConstraints() {
        
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(3.su)
        }
        
        informationStack.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(image.snp.bottom).offset(4.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = Asset.gray50.color
        layer.borderWidth = 1
        layer.borderColor = Asset.gray200.color.cgColor
        layer.cornerRadius = 8
    }
}
