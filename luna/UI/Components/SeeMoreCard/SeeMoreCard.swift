//
//  SeeMoreCard.swift
//  luna
//
//  Created by alexdamascena on 10/08/23.
//

import UIKit

class SeeMoreCard: UIView, AnyView {
    
    private let line = SegmentedLine()
    
    private(set) var seeMoreButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .seeMore)
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return button
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
        addSubview(seeMoreButton)
    }
    
    func addConstraints() {
        
        seeMoreButton.snp.makeConstraints{
            $0.leading.equalTo(line.snp.trailing).offset(1.8.su)
        }
        
        line.snp.makeConstraints {
            $0.top.height.equalToSuperview()
            $0.leading.equalToSuperview().offset(0.5.su)
            $0.width.equalTo(14)
            $0.height.equalTo(35)
        }
    }
}
