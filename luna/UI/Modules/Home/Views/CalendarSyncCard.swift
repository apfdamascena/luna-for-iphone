//
//  CalendarSync.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class CalendarSyncCard: UIView, AnyView {
    
    private let calendarTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .medium)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = (0.7).su
        let attributes: [NSAttributedString.Key: Any] = [.font: label.font, .paragraphStyle: paragraphStyle]
        label.attributedText = NSAttributedString(string: L10n.Constants.Content.Label.Home.calendarSync, attributes: attributes)
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let settingsSubtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.settingsSubtitle
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let acessSubtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.acessSubtitle
        label.textAlignment = .left
        label.numberOfLines = 0
        label.draw(model)
        return label
    }()
    
    private let settingsButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .settings)
        return button
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        stack.addArrangedSubview(settingsSubtitle)
        stack.addArrangedSubview(acessSubtitle)
        addSubview(stack)
        addSubview(calendarTitle)
        addSubview(settingsButton)
    }
    
    func addConstraints() {
        
        calendarTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        stack.snp.makeConstraints {
            $0.top.equalTo(calendarTitle.snp.bottom).offset((1.5).su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        settingsButton.snp.makeConstraints {
            $0.top.equalTo(stack.snp.bottom).offset(3.su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.bottom.equalToSuperview().offset(-4.su)
        }
        
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 1.su
        layer.borderWidth = 1
        layer.borderColor = Asset.gray200.color.cgColor
    }
    
}
