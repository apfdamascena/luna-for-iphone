//
//  LandingPageView.swift
//  luna
//
//  Created by gabrielfelipo on 21/07/23.
//

import UIKit
import SnapKit
import RxSwift



class LandingPageView: UIView, AnyView {
    private var disposeBag = DisposeBag()
    
    private let background: UIView = {
        let view = UIView()
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView(image: Asset.landingPageBackgroundImage.image)
        view.contentMode = .left
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 8
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 39,
                                      color: .black,
                                      weight: .bold)
        
        label.text = L10n.Constants.Content.Label.appName
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let landingPageDescription: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 31,
                                      color: .black,
                                      weight: .regular)
        
        label.text = L10n.Constants.Content.Label.landingPageDescription
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private(set) var startButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .initial)
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
        addSubview(background)
        addSubview(backgroundImage)
        addSubview(stack)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(landingPageDescription)
        addSubview(startButton)
        
    }
    
    func addConstraints() {
        
        background.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.su)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(stack.snp_topMargin).offset(0.su)
        }
        
        stack.snp.makeConstraints{
            $0.bottom.equalTo(startButton.snp_topMargin).offset(-7.su)
            $0.leading.equalToSuperview().offset(3.su)
        }
        
        startButton.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.bottom.equalToSuperview().offset(-6.su)
            $0.height.equalTo(50)
        }
        
    }
    
    
    func addAdditionalConfiguration() {
        background.backgroundColor = .white
    }
}
