//
//  ReferencesSheetView.swift
//  luna
//
//  Created by gabrielfelipo on 08/08/23.
//

import UIKit
import SnapKit

class ReferencesSheetView: UIView, AnyView {

    private let referencesTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20,
                                      color: .black,
                                      weight: .medium)
        
        label.text = "Referências"
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let reference1: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20,
                                      color: .black,
                                      weight: .medium)
        
        label.text = "Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586."
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let reference2: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20,
                                      color: .black,
                                      weight: .medium)
        
        label.text = "Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586."
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let reference3: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20,
                                      color: .black,
                                      weight: .medium)
        
        label.text = "Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586."
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let reference4: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20,
                                      color: .black,
                                      weight: .medium)
        
        label.text = "Mesen TB, Young SL. Progesterone and the luteal phase: a requisite to reproduction. Obstet Gynecol Clin North Am. 2015 Mar;42(1):135-51. PMID: 25681845; PMCID: PMC4436586."
        label.numberOfLines = 0
        label.textAlignment = .left
        
        label.draw(model)
        return label
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .equalCentering
        view.spacing = 1.su
        return view
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
        addSubview(stack)
        stack.addArrangedSubview(referencesTitle)
        stack.addArrangedSubview(reference1)
        stack.addArrangedSubview(reference2)
        stack.addArrangedSubview(reference3)
        stack.addArrangedSubview(reference4)
    }
    
    func addConstraints() {
        resizeIndicator.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.width.equalTo(36)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(6)
        }
        
        stack.snp.makeConstraints {
            $0.top.equalTo(resizeIndicator.snp.bottom).offset(1.su)
            $0.leading.equalToSuperview().offset(2.su)
            $0.trailing.equalToSuperview().offset(-2.su)
        }
        
        reference1.snp.makeConstraints {
            $0.width.equalToSuperview()
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
