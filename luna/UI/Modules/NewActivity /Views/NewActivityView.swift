//
//  NewActivityView.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//

import UIKit
import SnapKit

class NewActivityView: UIView, AnyView {
    
    private let activityTitle = NewActivityTitleStackView(
        frame: CGRect(),
        titleText: L10n.Constants.Content.Label.NewActivity.AddNewActivity.activityTitle,
        iconAsset: Asset.pencilIcon
    )
    
    private let metricsTitle = NewActivityTitleStackView(
        frame: CGRect(),
        titleText: L10n.Constants.Content.Label.NewActivity.AddNewActivity.metricsTitle,
        iconAsset: Asset.chartPieIcon
    )
    
    private let deadlineTitle = NewActivityTitleStackView(
        frame: CGRect(),
        titleText: L10n.Constants.Content.Label.NewActivity.AddNewActivity.deadlineTitle,
        iconAsset: Asset.deadlineIcon
    )
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let allContentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 4.su
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(allContentStackView)
        
        allContentStackView.addArrangedSubview(activityTitle)
        allContentStackView.addArrangedSubview(metricsTitle)
        allContentStackView.addArrangedSubview(deadlineTitle)
    }
    
    func addConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16.su)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        allContentStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.leading.width.equalTo(scrollView).inset(3.su)
        }
    }
    
    func addAdditionalConfiguration() {
        self.backgroundColor = .white
//        scrollView.backgroundColor = .blue
    }
    
}
