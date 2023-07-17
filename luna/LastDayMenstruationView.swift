//
//  LastDayMenstruationView.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit
import SnapKit


class LastDayMenstruationView: UIView, AnyView  {
    
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 40,
                                      color: .red,
                                      weight: .heavy)
        
        label.text = "Quando foi o início da sua última menstruação?"
        label.draw(model)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
    }
    
    func addConstraints() {
        
    }

}
