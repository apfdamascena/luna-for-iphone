//
//  OnboardingPageControlDataSource.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//

import UIKit
import RxSwift

protocol OnboardingPageControlDataSource {
    var pageIndex: BehaviorSubject<Int> { get }
    var pages: [UIViewController] { get }
}
