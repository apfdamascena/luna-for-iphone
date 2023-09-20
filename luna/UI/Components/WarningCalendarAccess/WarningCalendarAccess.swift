//
//  CalendarSync.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class WarningCalendarAccess: UIView, AnyView {
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        return view
    }()
    
    private let title: LunaText = {
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
    
    private(set) var settingsButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .settings)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSkeletonable = true
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(title)
        addSubview(stack)
        addSubview(settingsButton)
        
        stack.addArrangedSubview(settingsSubtitle)
        stack.addArrangedSubview(acessSubtitle)

    }
    
    func addConstraints() {
        
        stack.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset((1.5).su)
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4.su)
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
