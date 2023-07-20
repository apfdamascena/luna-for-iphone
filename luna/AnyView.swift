//
//  AnyView.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import Foundation

protocol AnyView {
    
    func addSubviews()
    func addConstraints()
    func addAdditionalConfiguration()
    
}

extension AnyView {
    
    func setupView(){
        addSubviews()
        addConstraints()
        addAdditionalConfiguration()
    }
    
    func addSubviews(){}
    func addConstraints(){}
    func addAdditionalConfiguration(){}
}
