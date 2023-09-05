//
//  HomeInteractorSpy.swift
//  lunaTests
//
//  Created by alexdamascena on 05/09/23.
//


protocol HomeInteractorSpy {
    
    var nextIndexForCardPhaseCalled: Bool { get }
    var openSettingsHasBeenCalled: Bool { get }
}
