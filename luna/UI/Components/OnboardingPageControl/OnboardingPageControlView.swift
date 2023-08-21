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
    
    private var dotSizeFlow: Int = 0
    
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
            dot.backgroundColor = index == 1 ? changeColorBy(index-1) : Asset.gray100.color
            dot.layer.cornerRadius = 2
            dots.append(dot)
            addSubview(dot)
        }
    }
    
    private func changeColorBy(_ index: Int) -> UIColor {
        switch index {
        case 0:
            return .blue
        case 1:
            return .brown
        case 2:
            return .orange
        case 3:
            return .cyan
            
        default:
            return .gray
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
        self.dotSizeFlow = dotSize
        
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
            dot.layer.sublayers?.popLast()
            
            if index <= currentPage {
                
                let gradient = CAGradientLayer()
                gradient.frame = dot.bounds
            
                gradient.colors = [Asset.dot11.color.cgColor,
                                   Asset.dot12.color.cgColor,
                                   Asset.dot13.color.cgColor]
                
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 1, y: 0)
                
                
                dot.layer.insertSublayer(gradient, at: 0)
            }
        }
    }
    
//    private func
}
