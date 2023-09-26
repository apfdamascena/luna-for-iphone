//
//  NewActivityView.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//

import UIKit
import SnapKit

class NewActivityView: UIView, AnyView {
    
    private(set) var activityStack = ActivityStack()
    private let metricsStack = MetricsStack()
    private let deadlineStack = DeadlineStack()
    private(set) var datePickerStack = DatePickerStack()
    private(set) var metricsComponent = MetricsComponent()
    
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
    
    var button: LunaButton = {
        let button = LunaButton()
        button.draw(style: .next)
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
        addSubview(scrollView)
        scrollView.addSubview(allContentStackView)
        
        allContentStackView.addArrangedSubview(activityStack)
        allContentStackView.addArrangedSubview(metricsStack)
        allContentStackView.addArrangedSubview(metricsComponent)
        
        allContentStackView.addArrangedSubview(deadlineStack)
        allContentStackView.addArrangedSubview(datePickerStack)
        
        allContentStackView.addArrangedSubview(button)
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
        
        activityStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(12.su)
        }
        
        metricsStack.snp.makeConstraints {
            $0.height.equalTo(7.su)
        }
        
        metricsComponent.snp.makeConstraints {
            $0.height.equalTo(43.5.su)
        }
        
        deadlineStack.snp.makeConstraints {
            $0.height.equalTo(7.su)
        }
        
        datePickerStack.snp.makeConstraints {
            $0.top.equalTo(deadlineStack.snp.bottom).offset(3.su)
            $0.height.equalTo(6.su)
        }
        
    }
    
    func addAdditionalConfiguration() {
        self.backgroundColor = .white
        allContentStackView.isLayoutMarginsRelativeArrangement = true
        allContentStackView.layoutMargins = UIEdgeInsets(top: 0,
                                                         left: 0,
                                                         bottom: 5.su,
                                                         right: 0)
    }
    
}


