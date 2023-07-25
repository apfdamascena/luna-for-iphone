//
//  OnboardingPageControlDelegateImpl.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//

import Foundation
import RxSwift

class OnboardingPageControlDelegateImpl: OnboardingPageControlDelegate {
    var direction: BehaviorSubject<UIPageViewController.NavigationDirection>  = BehaviorSubject(value: .forward)
    
}
