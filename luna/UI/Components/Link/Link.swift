//
//  Link.swift
//  luna
//
//  Created by sml on 09/08/23.
//

import UIKit
import SnapKit

class Link: UIView, AnyView {
    
    private let linkTextView: UITextView = {
        let link = UITextView()
        link.translatesAutoresizingMaskIntoConstraints = true
        link.sizeToFit()
        link.isScrollEnabled = false
        return link
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(linkTextView)
    }
    
    func addConstraints() {
        linkTextView.snp.makeConstraints {
            $0.height.trailing.leading.equalToSuperview()
        }
    }

    func draw(_ link: String){
        let attributedString = NSMutableAttributedString(string: "Disponível aqui!")
        attributedString.addAttribute(.link, value: link, range: NSRange(location: 0, length: 16))
        linkTextView.attributedText = attributedString
        let font = UIFont.systemFont(ofSize: 17)
        linkTextView.font = font
    }
}
