//
//  HomeViewControllerSpy.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//


protocol HomeViewControllerSpy {
    
    var shouldChangeCardPhase: Bool { get }
    var cardPhaseFake: Int { get }
    
}

