//
//  HomeInteractorMock.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

@testable import luna
import UIKit

protocol HomeInteractorSpy {
    
    var nextIndexForCardPhaseCalled: Bool { get }
}


class HomeInteractorMock: HomeInteractor, HomeInteractorSpy  {

    var nextIndexForCardPhaseCalled: Bool = false
    
    override func nextIndexForCardPhase(at index: Int) -> Int {
        nextIndexForCardPhaseCalled = true
        return super.nextIndexForCardPhase(at: index)
    }
    
}
