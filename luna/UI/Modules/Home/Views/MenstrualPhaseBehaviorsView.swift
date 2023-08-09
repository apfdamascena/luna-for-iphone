//
//  HomeCardsView.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit


class MenstrualPhaseBehaviorsView: UIView, AnyView {
    
    let whatIsCardInformation: CycleDetailsCard = {
        let container = CycleDetailsCard()
        container.title.text = "O que é?"
        return container
    }()
    
    let howAreYouCardInformation: CycleDetailsCard = {
        let container = CycleDetailsCard()
        container.title.text = "Como você está?"
        return container
    }()
    
    let betterAvoidCardInformation: CycleDetailsCard = {
        let container = CycleDetailsCard()
        container.title.text = "Melhor evitar, hein!"
        return container
    }()
    
    let wannaHelpCardInformation: CycleDetailsCard = {
        let container = CycleDetailsCard()
        container.title.text = "Quer uma ajuda?"
        return container
    }()
    
    let behindSheetsCardInformation: CycleDetailsCard = {
        let container = CycleDetailsCard()
        container.title.text = "Por trás dos panos"
        return container
    }()
    
    let stack: UIStackView = {
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
        whatIsCardInformation.line.ball.image = model.colorBall.image
        
        howAreYouCardInformation.subtitle.text = model.howAreYouDescription
        howAreYouCardInformation.line.ball.image = model.colorBall.image
        
        betterAvoidCardInformation.subtitle.text = model.avoidDescription
        betterAvoidCardInformation.line.ball.image = model.colorBall.image
        
        wannaHelpCardInformation.subtitle.text = model.helpDescription
        wannaHelpCardInformation.line.ball.image = model.colorBall.image
        
        behindSheetsCardInformation.subtitle.text = model.behindSheets
        behindSheetsCardInformation.line.ball.image = model.colorBall.image
    }
    
}


