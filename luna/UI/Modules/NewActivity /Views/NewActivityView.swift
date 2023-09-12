//
//  NewActivityView.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//

import UIKit

class NewActivityView: UIView, AnyView {
    
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
    }
    
    func addConstraints() {
        
    }
    
    func addAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
}
