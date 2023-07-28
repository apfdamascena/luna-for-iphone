//
//  OnboardingViewFlow.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//

import Foundation


class OnboardingViewFlow: OnboardingViewFlowDelegate {
    
    
    let numberOfPages: Int
    
    init(numberOfPages: Int){
        self.numberOfPages = numberOfPages
    }
    
    func calculate(newCurrentPage: Int) -> Int {
        if newCurrentPage < 0 { return 0 }
        if newCurrentPage == numberOfPages  { return numberOfPages  }
        return newCurrentPage
    }
}

