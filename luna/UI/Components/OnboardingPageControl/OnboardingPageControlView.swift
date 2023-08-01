//
//  OnboardingPageControl.swift
//  luna
//
//  Created by alexdamascena on 23/07/23.
//

import UIKit

extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}

class OnboardingPageControlView: UIView, AnyView {
    
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
        
        Array(1...numberOfPages).forEach{ index in
            let dot = UIView()
            dot.backgroundColor = index == 1 ? Asset.primaryRed900.color : .gray
            dot.layer.cornerRadius = 2
            dots.append(dot)
            addSubview(dot)
        }
    }
    
    struct DotViewConstant {
        static let MARGIN_CONTENT = 2 * 24
        static let LEFT_MARGIN_CONTENT = 24
        static let SPACING_DOT = 15
    }
    
    func addConstraints() {
        
        guard let screenSize = UIScreen.current?.bounds.width else { return }
        
        let margin = DotViewConstant.MARGIN_CONTENT
        let spaceBeetwenDots = (numberOfPages-1) * DotViewConstant.SPACING_DOT
 
        let remainScreenSize = Int(screenSize) - spaceBeetwenDots - margin
        
        let dotSize = remainScreenSize / numberOfPages
        
        dots.enumerated().forEach{ index, dot in
            let leadingSize = DotViewConstant.LEFT_MARGIN_CONTENT + dotSize*(index) + DotViewConstant.SPACING_DOT*(index)
            dot.snp.makeConstraints{
                $0.width.equalTo(dotSize)
                $0.height.equalTo(4)
                $0.leading.equalTo(leadingSize)
            }
        }
    }
    
    func completeDotAt(_ currentPage: Int){
        dots.enumerated().forEach{ index, dot in
            dot.backgroundColor = .gray
            
            if index <= currentPage {
                dot.backgroundColor = Asset.primaryRed900.color
            }
        }
    }
}
