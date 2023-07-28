//
//  OnboardingPageControlDataSourceImpl.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//

import RxSwift

class OnboardingPageControlDataSourceImpl: OnboardingPageControlDataSource {
    
    var direction: BehaviorSubject<UIPageViewController.NavigationDirection> = BehaviorSubject(value: .forward)
    
    var pageIndex: BehaviorSubject<Int> = BehaviorSubject(value: 0)
    
    var pages: [UIViewController] = [
        LastDayMenstruationRouter.createModule(),
        MenstruationDurationRouter.createModule(),
        CycleDurationRouter.createModule(),
        TeachRecordMenstruationRouter.createModule(),
        TeachRecordMenstruationRouter.createModule(),
        CalendarRouter.createModule()
    ]
}
