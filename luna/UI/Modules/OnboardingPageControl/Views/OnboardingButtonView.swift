//
//  OnboardingButtonView.swift
//  luna
//
//  Created by alexdamascena on 21/07/23.
//

import UIKit
import SnapKit

class OnboardingButtonView: UIView, AnyView {
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 2.su
        return view
    }()
    
    private(set) lazy var nextButton: LunaButton = {
        let button = LunaButton()
        let model = LunaButtonViewModel(style: .primary,
                                        textColor: .white,
                                        text: L10n.Constants.Content.Button.continue)
        
        button.draw(model)
        return button
    }()
    
    private(set) lazy var backButton: LunaButton = {
        let button = LunaButton()
        let model = LunaButtonViewModel(style: .secondary,
                                        textColor: .white,
                                        text: "Voltar")
        button.draw(model)
        return button
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
        
        stack.addArrangedSubview(backButton)
        stack.addArrangedSubview(nextButton)
    }
    
    func addConstraints() {
        
        stack.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.height.equalTo(8.su)
        }
    }
    
}
