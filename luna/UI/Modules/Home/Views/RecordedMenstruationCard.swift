//
//  RecordedMenstruationCard.swift
//  luna
//
//  Created by Cynara Costa on 30/07/23.
//

import UIKit
import SnapKit

class RecordedMenstruationCard: UIView, AnyView {
    
    private let recordedMenstruationText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.recordedMenstruation
        label.numberOfLines = 0
        label.textAlignment = .left
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
        addSubview(recordedMenstruationText)
    }
    
    func addConstraints() {
        recordedMenstruationText.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().offset(14)
            $0.leading.trailing.equalToSuperview().offset(20)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = Asset.secondaryRed100.color
        layer.cornerRadius = 1.su
        layer.borderWidth = 1
        layer.borderColor = Asset.secondaryRed200.color.cgColor
    }
    
}

