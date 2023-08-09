//
//  CardHomeInformation.swift
//  luna
//
//  Created by Cynara Costa on 02/08/23.
//

import UIKit
import SnapKit

class CycleDetailsCard: UIView, AnyView {

    let line = SegmentedLine()
    
    private let verticalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.spacing = 12
        return view
    }()
    
    var title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Home.Informational.what
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    var subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Text.HowAreYou.menstruation
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.draw(model)
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
        
        addSubview(line)
        
        addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(title)
        verticalStack.addArrangedSubview(subtitle)
    }
    
    func addConstraints() {
        
        verticalStack.snp.makeConstraints {
            $0.leading.equalTo(line.snp.trailing).offset(2.su)
            $0.top.trailing.equalToSuperview()
        }
        
        line.snp.makeConstraints {
            $0.top.height.equalToSuperview()
            $0.leading.equalToSuperview().offset(0.5.su)
            $0.width.equalTo(14)
            $0.height.equalTo(verticalStack).multipliedBy(1.4)
        }
    }

    func draw(_ model: CyclePhaseTextViewModel){
        subtitle.text = model.whatIsDescription
         
    }
    
}
