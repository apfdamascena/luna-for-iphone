//
//  ReferencesSheetView.swift
//  luna
//
//  Created by gabrielfelipo on 08/08/23.
//

import UIKit
import SnapKit

class ReferencesSheetView: UIView, AnyView {
    
    private(set) var firstReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            reference: L10n.Constants.Content.Label.Home.Text.References.first,
            title: "Progesterone and the luteal phase: a requisite to reproduction.")
        
        
        card.draw(viewModel)
        return card
    }()
    
    private(set) var secondReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            reference: L10n.Constants.Content.Label.Home.Text.References.second,
            title: "Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular.")
        card.draw(viewModel)
        return card
    }()
    
    private(set) var thirdReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            reference: L10n.Constants.Content.Label.Home.Text.References.third,
            title: "Estilo de vida e fatores reprodutivos associados ao comprimento da fase folicular.")
        card.draw(viewModel)
        return card
    }()
    
    private(set) var fourthReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            reference: L10n.Constants.Content.Label.Home.Text.References.fourth,
            title: "Neuropsychological performance and menstrual cycle: a literature review.")
        card.draw(viewModel)
        return card
    }()
    
    private(set) var fifthReference: ReferenceCard = {
        let card = ReferenceCard()
        let viewModel = ReferenceTextViewModel(
            reference: L10n.Constants.Content.Label.Home.Text.References.fifth,
            title: "Menstrual cycle-associated symptoms and workplace productivity in US employees: A cross-sectional survey of users of the Flo mobile phone app.")
        card.draw(viewModel)
        return card
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 3.su, right: 0)
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stack)
        
        stack.addArrangedSubview(firstReference)
        stack.addArrangedSubview(secondReference)
        stack.addArrangedSubview(thirdReference)
        stack.addArrangedSubview(fourthReference)
        stack.addArrangedSubview(fifthReference)
    }
    
    func addConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.top.equalTo(safeAreaLayoutGuide)
        }
        
        stack.snp.makeConstraints {
            $0.top.equalTo(scrollView).offset(2.su)
            $0.bottom.equalToSuperview()
            $0.leading.width.equalTo(scrollView)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 0, height: -4)
        layer.shadowOpacity = 1
        layer.shadowColor = Asset.gray200.color.cgColor
    }

}
