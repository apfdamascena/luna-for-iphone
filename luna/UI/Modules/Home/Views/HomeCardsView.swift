//
//  HomeCardsView.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit


class HomeCardView: UIView, AnyView {
    
    private var cards: [CardHomeInformation] = []
    
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
        
        
        cards.forEach{ card in
            stack.addArrangedSubview(card)
        }
        
        addSubview(stack)
        
    }
    
    func addConstraints() {
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setLearningCards(_ cards: [CyclePhaseText]){
        
        let teste = cards.map{ card in
            let opa = CardHomeInformation()
            let model = CyclePhaseTextFactory.create(phase: card)
            opa.draw(model)
            
            return opa
        }
        self.cards = teste
        DispatchQueue.main.async {
            self.addSubviews()
        }
  
    }
    
}


