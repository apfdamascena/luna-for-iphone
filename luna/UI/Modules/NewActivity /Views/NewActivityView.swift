//
//  NewActivityView.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//

import UIKit

class NewActivityView: UIView, AnyView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAdditionalConfiguration() {
        self.backgroundColor = .blue
    }
    
}
