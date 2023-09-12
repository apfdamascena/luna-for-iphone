//
//  ActivityTitleStack.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//

import UIKit

class ActivityTitleStack: UIStackView, AnyView {
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.AddNewActivity.activityTitle
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let icon: UIImageView = {
        let view = UIImageView(image: Asset.pencilIcon.image)
        view.contentMode = .scaleAspectFit
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addArrangedSubview(icon)
        addArrangedSubview(title)
    }
    
    func addAdditionalConfiguration() {
        axis = .horizontal
        alignment = .center
        spacing = 1.su
    }
}
