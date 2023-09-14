//
//  FirstTimeNewAcitivityView.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//

import UIKit
import SnapKit

class FirstTimeNewActivityView: UIView, AnyView {
    
    private let screenHeight = UIScreen.main.bounds.height
    private let screenWidth = UIScreen.main.bounds.width
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let image: UIImageView = {
        let view = UIImageView(image: Asset.avatarImageFirstTimeNewActivity.image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let informationTextStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2.su
        return stack
    }()
    
    private let title: LunaText = {
            let label = LunaText()
            let model = LunaTextViewModel(size: 34,
                                          color: .white,
                                          weight: .semibold)
            label.text = L10n.Constants.Content.Label.FirstTimeNewActivity.title
        
            label.draw(model)
            label.numberOfLines = 0
            label.addLineHeight(of: 31)
            return label
        }()
        
    private let subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17,
                                      color: .white,
                                      weight: .regular)
        label.draw(model)
        label.numberOfLines = 0
        label.text = L10n.Constants.Content.Label.FirstTimeNewActivity.subtitle
        label.addLineHeight(of: 24)
        return label
    }()
    
    var button: LunaButton = {
        let button = LunaButton()
        button.draw(style: .letsGo)
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
        addSubview(backgroundImage)
        addSubview(image)
        addSubview(informationTextStack)
        addSubview(button)
        
        informationTextStack.addArrangedSubview(title)
        informationTextStack.addArrangedSubview(subtitle)
    }
    
    func addConstraints() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(screenWidth * 0.646)
            $0.height.equalTo(screenHeight * 0.3)
            $0.top.equalTo(screenHeight * 0.17)
        }
        
        informationTextStack.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(screenHeight * 0.526)
        }
        
        button.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(screenHeight * 0.84)
        }
        
    }
    
    func addAdditionalConfiguration() {
        backgroundImage.image = Asset.backgroundFirstTimeNewActivity.image
    }
    
}
