//
//  CardHomeInformation.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit
import SnapKit

class CardHomeInformation: UIView, AnyView {
    
    private let subtitleContainer = UIView()

    
    private let lineComponent: UIImageView = {
        let view = UIImageView(image: Asset.redLine.image)
        view.contentMode = .scaleAspectFit
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.clipsToBounds = true
        return view
    }()
    
    private let verticalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.spacing = 12
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Home.Informational.what
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    
    private var subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Placeholder.big
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.draw(model)
        return label
    }()
    
    private let horizontalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.spacing = 16
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
        
        verticalStack.addArrangedSubview(title)
        verticalStack.addArrangedSubview(subtitleContainer)
        
        subtitleContainer.addSubview(subtitle)
        
        horizontalStack.addArrangedSubview(lineComponent)
        horizontalStack.addArrangedSubview(verticalStack)
        
        addSubview(horizontalStack)
        
    }
    
    func addConstraints() {
        
        horizontalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        subtitle.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        lineComponent.snp.makeConstraints {
            $0.height.equalToSuperview()
        }
        
    }
    
    func addAdditionalConfiguration() {
    
    }
    
    func draw(_ model: CyclePhaseTextViewModel){
        subtitle.text = model.whatIsDescription
    }
    
}
