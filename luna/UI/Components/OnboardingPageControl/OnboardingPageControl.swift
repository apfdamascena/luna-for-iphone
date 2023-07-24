//
//  OnboardingPageControl.swift
//  luna
//
//  Created by alexdamascena on 23/07/23.
//

import UIKit


class OnboardingPageControl: UIView, AnyView {
    
    var numberOfPages: Int = 0
    var currentPage: Int = 0
    
    var dots: [UIView] = []
    
    init(numberOfPages: Int){
        super.init(frame: .zero)
        self.numberOfPages = numberOfPages
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        for index in 1...numberOfPages {
            let dot = UIView()
            dot.backgroundColor = index == 1 ? .black : .gray
            dot.layer.cornerRadius = 2
            dots.append(dot)
            
            addSubview(dot)
        }
    }
    
    func addConstraints() {
        
        dots.enumerated().forEach{ index, dot in
            dot.snp.makeConstraints{
                $0.width.equalTo(74)
                $0.height.equalTo(4)
                $0.leading.equalTo(24 + 74*(index) + 15*(index))
        
            }
        }
    }
    
    func completeDotAt(_ currentPage: Int){
        dots.enumerated().forEach{ index, dot in
            dot.backgroundColor = .gray
            
            if index <= currentPage {
                dot.backgroundColor = .black
            }
        }
    }
}
