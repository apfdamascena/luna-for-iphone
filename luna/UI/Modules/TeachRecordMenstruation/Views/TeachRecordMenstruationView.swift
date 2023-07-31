//
//  TeachRecordMenstruationView.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//

import UIKit

class TeachRecordMenstruationView: UIView, AnyView {

    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 28,
                                      color: .black,
                                      weight: .medium)
        
        label.text = L10n.Constants.Content.Label.registerMenstruation
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let teachRegisterImage: UIImageView = {
        let view = UIImageView(image: Asset.teachRegisterMenstruation.image)
        return view
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.gray150.color
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4.su
        return view
    }()
    
    private let cards = [OnboardingCyclePhaseCard(), OnboardingCyclePhaseCard()]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubviews() {
        
        addSubview(title)
        addSubview(teachRegisterImage)
        addSubview(line)
        
        addSubview(stack)
        
        cards.forEach { card in
            stack.addArrangedSubview(card)
        }
    
    }
    
    func addConstraints() {
        
        title.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5.su)
        }
        
        teachRegisterImage.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(5.su)
            $0.leading.trailing.equalToSuperview()
        }
        
        line.snp.makeConstraints {
            
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(teachRegisterImage.snp.bottom).offset(5.su)
        }
        
        stack.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.top.equalTo(line.snp.bottom).offset(5.su)
        }
        
        cards.forEach { card in
            card.snp.makeConstraints{
                $0.height.equalTo(11.su)
            }
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}
