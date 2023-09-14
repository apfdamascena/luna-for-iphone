//
//  ActivityStack.swift
//  luna
//
//  Created by Cynara Costa on 13/09/23.
//

import UIKit
import SnapKit

class MetricsStack: UIStackView, AnyView {
    
    private let metricsTitle = NewActivityTitleStackView(
        frame: CGRect(),
        titleText: L10n.Constants.Content.Label.NewActivity.AddNewActivity.metricsTitle,
        iconAsset: Asset.chartPieIcon
    )
    
    private let metricsSubtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13, color: Asset.gray400.color, weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.AddNewActivity.subtitleMetrics
        label.addLineHeight(of: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addArrangedSubview(metricsTitle)
        addArrangedSubview(metricsSubtitle)
    }
    
    func addConstraints() {
                
    }
    
    func addAdditionalConfiguration() {
        axis = .vertical
        alignment = .leading
        spacing = 1/2.su
    }
    
}
