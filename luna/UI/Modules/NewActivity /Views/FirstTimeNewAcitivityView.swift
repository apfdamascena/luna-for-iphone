//
//  FirstTimeNewAcitivityView.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//

import UIKit
import SnapKit

class FirstTimeNewActivityView: UIView, AnyView {
    
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
    
    private(set) var button: LunaButton = {
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
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalToSuperview().offset(19.su)
        }
        
        informationTextStack.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(image.snp.bottom).offset(7.su)
        }
        
        button.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(informationTextStack.snp.bottom).offset(15.su)
        }
        
    }
    
    func addAdditionalConfiguration() {
        backgroundImage.image = Asset.backgroundFirstTimeNewActivity.image
    }
    
}
