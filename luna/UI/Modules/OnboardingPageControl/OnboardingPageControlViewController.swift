//
//  OnboardingPageControlViewController.swift
//  luna
//
//  Created by alexdamascena on 21/07/23.
//  
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa


class OnboardingPageControlDataSourceImpl: OnboardingPageControlDataSource {
    var pageIndex: BehaviorSubject<Int> = BehaviorSubject(value: 0)
    
    var pages: [UIViewController] = [
        LastDayMenstruationRouter.createModule(),
        MenstruationDurationRouter.createModule(),
        MenstruationDurationRouter.createModule(),
        MenstruationDurationRouter.createModule()
    ]
}

protocol DataSourceEventObservable {
    
    func addDataSourceEventObservable()
}

protocol OnboardingViewFlowDelegate {
    
    func change(newCurrentPage: Int) -> Int
}

class OnboardingViewFlow: OnboardingViewFlowDelegate {
    
    let numberOfPages: Int
    
    init(numberOfPages: Int){
        self.numberOfPages = numberOfPages
    }
    
    func change(newCurrentPage: Int) -> Int {
        if newCurrentPage < 0 { return 0 }
        if newCurrentPage == numberOfPages  { return numberOfPages  }
        return newCurrentPage
    }
    
}


class OnboardingPageControlViewController: UIPageViewController,
                                           AnyView,
                                           TouchableUserEvent,
                                           DataSourceEventObservable {

    var presenter: ViewToPresenterOnboardingPageControlProtocol?
    
    private(set) var datasource: OnboardingPageControlDataSource?
    private(set) var flow: OnboardingViewFlow?
    
    private let onboardingButtons = OnboardingButtonView()
    
    private var disposeBag = DisposeBag()
    
    private(set) var pageControl: OnboardingPageControl
    
    init(datasource: OnboardingPageControlDataSource){
        self.pageControl = OnboardingPageControl(numberOfPages: 4)
        self.flow = OnboardingViewFlow(numberOfPages: 4)
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        self.datasource = datasource
      

        
        addUserTouchTrigger()
        addDataSourceEventObservable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func addSubviews() {
        view.addSubview(onboardingButtons)
        view.addSubview(pageControl)
    }

    func addConstraints() {
        
        pageControl.snp.makeConstraints{
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }

        onboardingButtons.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-2.su)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(7.su)
        }
    }
    
    func addUserTouchTrigger() {
        
        onboardingButtons.nextButton.rx.tap.bind {
            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
            
            guard let nextPage = self.flow?.change(newCurrentPage: currentPage + 1) else { return }
            if nextPage == self.pageControl.numberOfPages {
                self.datasource?.pageIndex.onCompleted()
            }
            
            self.datasource?.pageIndex.onNext(nextPage)
            self.presenter?.completeOnboardFlowDot(at: nextPage)
    
        }.disposed(by: disposeBag)
        
        
        onboardingButtons.backButton.rx.tap.bind {
            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
            guard let previousPage = self.flow?.change(newCurrentPage: currentPage - 1) else { return }
            self.datasource?.pageIndex.onNext(previousPage)
        
            self.presenter?.completeOnboardFlowDot(at: previousPage)
        }.disposed(by: disposeBag)
        
    }
    
    func addDataSourceEventObservable() {

        datasource?.pageIndex.subscribe(onNext: { pageIndex in
            guard let controller = self.datasource?.pages[pageIndex] else { return }
            self.setViewControllers([controller], direction: .forward, animated: true)
        }, onCompleted: {
            self.presenter?.userTappedContinueButton()
        }).disposed(by: disposeBag)
    }

}

extension OnboardingPageControlViewController: PresenterToViewOnboardingPageControlProtocol {
    
    func completeOnboardFlowDot(at currentPage: Int) {
        pageControl.completeDotAt(currentPage)
    }
    
    
    
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct OnboardingPageControlViewController_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingPageControlViewController(datasource: OnboardingPageControlDataSourceImpl()).showPreview()
    }
}

#endif



