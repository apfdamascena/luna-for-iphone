//
//  ActivityTitleStack.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//

import UIKit

class NewActivityTitleStackView: UIStackView, AnyView {
    
    private var titleText: String
    private var iconAsset: ImageAsset
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.addLineHeight(of: 31)
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
    
    init(frame: CGRect, titleText: String, iconAsset: ImageAsset) {
        self.titleText = titleText
        self.iconAsset = iconAsset
        
        title.text = titleText
        icon.image = iconAsset.image
        
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
