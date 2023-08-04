//
//  HomeCardsView.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit


class MenstrualPhaseBehaviorsView: UIView, AnyView {
    
    private let whatIsCardInformation: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "O que é?"
        return container
    }()
    
    private let howAreYouCardInformation: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Como você está?"
        return container
    }()
    
    private let betterAvoidCardInformation: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Melhor evitar, hein!"
        return container
    }()
    
    private let wannaHelpCardInformation: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Quer uma ajuda?"
        return container
    }()
    
    private let behindSheetsCardInformation: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Por trás dos panos"
        return container
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
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
        addSubview(stack)
    
        stack.addArrangedSubview(whatIsCardInformation)
        stack.addArrangedSubview(howAreYouCardInformation)
        stack.addArrangedSubview(betterAvoidCardInformation)
        stack.addArrangedSubview(wannaHelpCardInformation)
        stack.addArrangedSubview(behindSheetsCardInformation)
    }
    
    func addConstraints() {
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    
    func draw(_ model: CyclePhaseTextViewModel){
        whatIsCardInformation.subtitle.text = model.whatIsDescription
        howAreYouCardInformation.subtitle.text = model.howAreYouDescription
        betterAvoidCardInformation.subtitle.text = model.avoidDescription
        wannaHelpCardInformation.subtitle.text = model.helpDescription
        behindSheetsCardInformation.subtitle.text = model.behindSheets
    }
    
}


