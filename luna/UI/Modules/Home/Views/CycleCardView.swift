//
//  CycleCardView.swift
//  luna
//
//  Created by Cynara Costa on 23/08/23.
//

import UIKit
import SnapKit

class CycleCardView: UIView, AnyView {
    
    public let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 2.su
        view.alignment = .fill
        return view
    }()
    
    private let aboutText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 12, color: Asset.gray950.color, weight: .semibold)
        label.text = L10n.Constants.Content.Label.Home.about
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    public let testBar: UIImageView = {
        let view = UIImageView(image: Asset.testBar.image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .regular)
        label.text = "Você está literalmente sangrando!"
        label.numberOfLines = 0
        label.textAlignment = .left
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
        addSubview(stack)
        addSubview(title)
        stack.addArrangedSubview(aboutText)
        stack.addArrangedSubview(testBar)
    }
    
    func addConstraints() {
        
        stack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(2.su)
            $0.top.equalToSuperview().offset(3.su)
        }

        title.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2.su)
            $0.trailing.equalToSuperview().offset(-129)
            $0.top.equalTo(stack.snp.bottom).offset(4.su)
            
        }
        
    }
    
    func draw(_ model: DynamicCardPhaseViewModel) {
        self.backgroundColor = UIColor(patternImage: model.backgroundImage)
        title.text = model.titleText
    }
    
}
