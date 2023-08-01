//
//  OnboardingCyclePhaseContent.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//

import UIKit
import SnapKit


class OnboardingCyclePhaseContent: UIView,
                                   AnyView,
                                   DrawableView {

    typealias ViewModel = OnboardingCyclePhaseContentViewModel
    
    let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 0.5.su
        return view
    }()
    
    let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 22,
                                      color: Asset.primaryGray900.color,
                                      weight: .semibold)
        label.draw(model)
        return label
    }()
    
    let subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        label.draw(model)
        label.numberOfLines = 0
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
        addSubview(stack)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(subtitle)
    }
    
    func addConstraints() {
        
        stack.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func draw(_ model: OnboardingCyclePhaseContentViewModel) {
        title.text = model.title
        subtitle.text = model.subtitle
    }
}
