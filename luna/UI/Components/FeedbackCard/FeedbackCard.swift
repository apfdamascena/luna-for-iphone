//
//  RecordedMenstruationCard.swift
//  luna
//
//  Created by Cynara Costa on 30/07/23.
//

import UIKit
import SnapKit



class FeedbackCard: UIView, AnyView {
    
    private let message: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13, color: .black, weight: .regular)
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
        addSubview(message)
    }
    
    func addConstraints() {
        message.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(20)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = Asset.secondaryRed100.color
        layer.cornerRadius = 1.su
        layer.borderWidth = 1
        layer.borderColor = Asset.secondaryRed200.color.cgColor
    }
    
    func message(for action: FeedbackAfterAction){
        message.text = action.value
    }
    
}

