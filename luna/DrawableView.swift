//
//  Drawable.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import Foundation


protocol DrawableView {
    
    associatedtype T
    
    func draw(_ model: T)
}
