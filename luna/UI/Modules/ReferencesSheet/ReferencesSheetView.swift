//
//  ReferencesSheetView.swift
//  luna
//
//  Created by gabrielfelipo on 08/08/23.
//

import UIKit
import SnapKit

class ReferencesSheetView: UIView, AnyView {
    
    private let firstReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            number: "1.",
            reference: L10n.Constants.Content.Label.Home.Text.References.first,
            link: L10n.Constants.Content.Label.Home.Link.References.first)
        card.draw(viewModel)
        return card
    }()
    
    private let secondReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            number: "2.",
            reference: L10n.Constants.Content.Label.Home.Text.References.second,
            link: L10n.Constants.Content.Label.Home.Link.References.second)
        card.draw(viewModel)
        return card
    }()
    
    private let thirdReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            number: "3.",
            reference: L10n.Constants.Content.Label.Home.Text.References.third,
            link: L10n.Constants.Content.Label.Home.Link.References.third)
        card.draw(viewModel)
        return card
    }()
    
    private let fourthReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            number: "4.",
            reference: L10n.Constants.Content.Label.Home.Text.References.fourth,
            link: L10n.Constants.Content.Label.Home.Link.References.fourth)
        card.draw(viewModel)
        return card
    }()
    
    private let fifthReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            number: "5.",
            reference: L10n.Constants.Content.Label.Home.Text.References.fifth,
            link: L10n.Constants.Content.Label.Home.Link.References.fifth)
        card.draw(viewModel)
        return card
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3.su
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let resizeIndicator = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(resizeIndicator)
        addSubview(scrollView)
        
        scrollView.addSubview(stack)
        
        stack.addArrangedSubview(firstReference)
        stack.addArrangedSubview(secondReference)
        stack.addArrangedSubview(thirdReference)
        stack.addArrangedSubview(fourthReference)
        stack.addArrangedSubview(fifthReference)
    }
    
    func addConstraints() {
        resizeIndicator.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.width.equalTo(36)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(6)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(1.su)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }

        stack.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.leading.width.equalTo(scrollView).inset(2.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        resizeIndicator.backgroundColor = Asset.gray200.color
        resizeIndicator.layer.cornerRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: -4)
        layer.shadowOpacity = 1
        layer.shadowColor = Asset.gray200.color.cgColor
        
    }

}
