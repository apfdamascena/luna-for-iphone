//
//  OnboardingPageControl.swift
//  luna
//
//  Created by alexdamascena on 23/07/23.
//

import UIKit

extension UIView {

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

class OnboardingPageControl: UIView, AnyView {
    
    var numberOfPages: Int = 4
    var currentPage: Int = 1
    
    var dots: [UIView] = []
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        for index in 1...numberOfPages {
            let dot = UIView()
            dot.backgroundColor = index == currentPage ? .black : .gray
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
}
