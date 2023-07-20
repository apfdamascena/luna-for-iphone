//
//  Drawable.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import Foundation


protocol DrawableView {
    
    
    associatedtype ViewModel
    
    func draw(_ model: ViewModel)
}
