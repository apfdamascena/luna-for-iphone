//
//  DivView.swift
//  luna
//
//  Created by Cynara Costa on 14/09/23.
//

import UIKit
import SnapKit

class Div: UIView, AnyView {
    
    private let div: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.gray200.color
        view.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(div)
    }
    
    func addConstraints() {
        div.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

