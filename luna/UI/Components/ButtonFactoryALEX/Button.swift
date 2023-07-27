//
//  Button.swift
//  luna
//
//  Created by Cynara Costa on 26/07/23.
//

import UIKit

protocol Button {
    func setTitleProperties()
    func setBackgroundColor()
}

class BackButton: UIButton, Button {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleProperties()
        self.setBackgroundColor()
        self.setImageForButton()
        self.addAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitleProperties() {
        self.setTitle("Voltar", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.setTitleColor(Asset.primaryRed900.color, for: .normal)
        
    }
    
    func setBackgroundColor() {
        self.backgroundColor = .clear
    }
    
    func setImageForButton() {
        self.setImage(Asset.arrowLeftIcon.image, for: .normal)
        self.configuration?.imagePlacement = .leading
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 1.su)
    }
    
    func addAdditionalConfiguration() {
        self.contentEdgeInsets = UIEdgeInsets(top: 1.su, left: (1.2).su, bottom: 1.su, right: (1.2).su)
    }
    
}

class ProceedButton: UIButton, Button {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleProperties()
        self.setBackgroundColor()
        self.setCorners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitleProperties() {
        self.setTitle("Continuar", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.titleLabel?.textColor = .white
    }
    
    func setBackgroundColor() {
        self.backgroundColor = Asset.primaryRed900.color
    }
    
    func setCorners() {
        self.layer.cornerRadius = 1.su
        self.clipsToBounds = true
    }
    
}
