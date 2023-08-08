//
//  SegmentedLine.swift
//  luna
//
//  Created by alexdamascena on 03/08/23.
//

import UIKit

class SegmentedLine: UIView, AnyView {
    
    var ball: UIImageView = {
        let view = UIImageView(image: Asset.ball.image)
        return view
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.gray200.color
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
        
        addSubview(ball)
        addSubview(line)
    }
    
    func addConstraints() {
        
        ball.snp.makeConstraints{
            $0.centerX.top.equalToSuperview()
        }
        
        line.snp.makeConstraints{
            $0.top.centerX.equalTo(ball)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(1)
        }
    }
    
    func addAdditionalConfiguration() {
        ball.layer.zPosition = 13
    }
    
    func draw(_ color: BallComponent){
        
    }
    
}
