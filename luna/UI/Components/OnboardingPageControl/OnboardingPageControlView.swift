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
    
    var dots: [UIImageView] = [
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView()
    ]
    
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
        
        dots.forEach{ dot in
            addSubview(dot)
            dot.image = Asset.dotNone.image
        }
        
        dots[0].image = Asset.dot1.image
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
            dot.image = Asset.dotNone.image
            
            if(index <= currentPage){
                let image = updateDotsFlow(with: index)
                dot.image = image
            }
        }
    }
    
    
    private func updateDotsFlow(with index: Int) -> UIImage {
        switch index {
        case 0:
            return Asset.dot1.image
        case 1:
            return Asset.dot2.image
        case 2:
            return Asset.dot3.image
        case 3:
            return Asset.dot4.image
        default:
            return Asset.dotNone.image
            
        }
    }
}
