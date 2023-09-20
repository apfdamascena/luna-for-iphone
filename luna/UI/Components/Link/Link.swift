//
//  Link.swift
//  luna
//
//  Created by sml on 09/08/23.
//

import UIKit
import SnapKit


class Link: UIView, AnyView {
    
    private let linkTextView: UILabel = {
        let link = UILabel()
        link.numberOfLines = 0
        return link
    }()
    
    private let linkStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .top
        stack.spacing = 1.su
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        return stack
    }()
    
    private let icon: UIImageView = {
        return UIImageView(image: Asset.linkIcon.image)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(linkStack)
        linkStack.addArrangedSubview(icon)
        linkStack.addArrangedSubview(linkTextView)

    }
    
    func addConstraints() {
        
        linkStack.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

    func draw(_ title: String){
        let font = UIFont.systemFont(ofSize: 17)
        linkTextView.font = font
        linkTextView.text = title
        linkTextView.textColor = Asset.gray950.color
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .yellow
        layer.cornerRadius = 8
        backgroundColor = Asset.gray50.color
        layer.borderWidth = 1
        layer.borderColor = Asset.gray200.color.cgColor
    }
}
