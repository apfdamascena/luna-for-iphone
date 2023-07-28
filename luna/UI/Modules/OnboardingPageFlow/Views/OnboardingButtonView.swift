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
        view.distribution = .fillEqually
//        view.spacing = 12.su
        return view
    }()
    
    private(set) lazy var nextButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .next)
        return button
    }()
    
    private(set) lazy var endOnboardingButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .next)
        return button
    }()
    
    private(set) lazy var previousButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .previous)
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
        addSubview(endOnboardingButton)
        
        stack.addArrangedSubview(previousButton)
        stack.addArrangedSubview(nextButton)
    }
    
    func addConstraints() {
        
        stack.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.height.equalTo(8.su)
        }
        
        nextButton.snp.makeConstraints {
            $0.height.equalTo(6.su)
        }
        

        
        previousButton.snp.makeConstraints {
            $0.height.equalTo(4.su)
        }
        
        endOnboardingButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
    }
    
    func addAdditionalConfiguration() {
        endOnboardingButton.isHidden = true
    }
    
}
