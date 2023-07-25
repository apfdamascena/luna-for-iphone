//
//  OnboardingPageControlDelegate.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//

import RxSwift


protocol OnboardingPageControlDelegate {
    
    var direction: BehaviorSubject<UIPageViewController.NavigationDirection> { get }
}
