//
//  MenstruationDurationView.swift
//  luna
//
//  Created by sml on 21/07/23.
//

import UIKit
import SnapKit

class MenstruationDurationView: UIView, AnyView {
    
    private let background: UIImageView = {
        let view = UIImageView(image: Asset.background.image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        return view
    }()
        
    private let title: LunaText = {
        let label = LunaText()
        let viewModel = LunaTextViewModel(size: 28,
                                          color: .black,
                                          weight: .heavy)
        label.text = L10n.Constants.Content.Label.menstruationDuration
        label.numberOfLines = 0
        label.textAlignment = .center
        label.draw(viewModel)
        return label
    }()
    
    private let pickerContainer = UIView()
        
    private(set) var picker: UIPickerView = {
        let picker = UIPickerView()
        return picker
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
        
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(pickerContainer)

        pickerContainer.addSubview(picker)
    }
    
    func addConstraints() {
        stack.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
        
    }
    
}
