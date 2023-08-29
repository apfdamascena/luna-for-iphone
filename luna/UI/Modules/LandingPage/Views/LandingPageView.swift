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
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView(image: Asset.landingPageBackgroundImage.image)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 1.su
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 39,
                                      color: .black,
                                      weight: .semibold)

        label.text = L10n.Constants.Content.Label.onboardingLandingPage
        label.numberOfLines = 0
        label.textAlignment = .center
        label.draw(model)
        label.font = UIFont(name: "Cocon-Regular", size: 38)
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
        addSubview(backgroundImage)
        addSubview(stack)
        stack.addArrangedSubview(title)
        addSubview(startButton)
        
    }
    
    func addConstraints() {
        
        backgroundImage.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        stack.snp.makeConstraints {
            $0.bottom.equalTo(startButton.snp.top).offset(-7.su)
            $0.trailing.leading.equalToSuperview().inset(3.su)
        }
        
        title.snp.makeConstraints {
            $0.height.equalTo(12.su)
        }
        
        startButton.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-2.su)
            $0.height.equalTo(50)
        }
    }
    
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}
