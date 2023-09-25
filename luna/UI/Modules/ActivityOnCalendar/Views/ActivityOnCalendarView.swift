//
//  ActivityOnCalendarView.swift
//  luna
//
//  Created by alexdamascena on 19/09/23.
//

import UIKit
import SnapKit

class ActivityOnCalendarView: UIView, AnyView {
    
    private let memojiTitleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 5.su
        return stack
    }()
    
    private let memoji: UIImageView = {
        let view = UIImageView(image: Asset.lunaMemoji.image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 34,
                                      color: Asset.gray950.color,
                                      weight: .semibold)
        label.draw(model)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Sua atividade está no calendário!"
        return label
    }()
    
    private(set) var newActivity: LunaButton = {
        let button = LunaButton()
        button.draw(style: .newActivity)
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
        addSubview(memojiTitleStack)
        
        memojiTitleStack.addArrangedSubview(memoji)
        memojiTitleStack.addArrangedSubview(title)
        
        addSubview(newActivity)
    }
    
    func addConstraints() {
        
        memojiTitleStack.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.top.equalTo(safeAreaLayoutGuide).offset(9.su)
        }
        
        newActivity.snp.makeConstraints{
            
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-8.4.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
}
