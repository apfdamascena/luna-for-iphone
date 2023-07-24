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

protocol OnboardingPageControlDataSource {
    var pageIndex: BehaviorSubject<Int> { get }
    var pages: [UIViewController] { get }
}

class OnboardingPageControlDataSourceImpl: OnboardingPageControlDataSource {
    var pageIndex: BehaviorSubject<Int> = BehaviorSubject(value: 0)
    
    var pages: [UIViewController] = [
        LastDayMenstruationRouter.createModule(),
        MenstruationDurationRouter.createModule()
    ]
}

protocol DataSourceEventObservable {
    
    func addDataSourceEventObservable()
}

//extension OnboardingPageControlViewController:
//                               UIPageViewControllerDelegate,
//                                       UIPageViewControllerDataSource {
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        datasource?.pages[0]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        datasource?.pages[1]
//    }
//}

class OnboardingPageControlViewController: UIPageViewController,
                                           AnyView,
                                           TouchableUserEvent,
                                           DataSourceEventObservable {

    var presenter: ViewToPresenterOnboardingPageControlProtocol?
    private(set) var datasource: OnboardingPageControlDataSource?
    
    private let onboardingButtons = OnboardingButtonView()
    private var disposeBag = DisposeBag()
    
    
    private let pageControl: OnboardingPageControl = {
        let control = OnboardingPageControl()
        return control
    }()
    
    
    init(datasource: OnboardingPageControlDataSource){
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
        
        pageControl.backgroundColor = .red
        
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
        
        
//        onboardingButtons.nextButton.rx.tap.bind {
//            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
//
//            if currentPage + 1 == self.datasource?.pages.count {
//                self.datasource?.pageIndex.onCompleted()
//            }
//
//            self.datasource?.pageIndex.onNext(currentPage + 1)
//        }.disposed(by: disposeBag)
//
//        onboardingButtons.backButton.rx.tap.bind {
//            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
//            let previousCalculate = currentPage - 1
//            let previousPage = previousCalculate > 0 ? previousCalculate : 0
//            self.datasource?.pageIndex.onNext(previousPage)
//        }.disposed(by: disposeBag)
        
    }
    
    func addDataSourceEventObservable() {

//        datasource?.pageIndex.subscribe(onNext: { pageIndex in
//            guard let controller = self.datasource?.pages[pageIndex] else { return }
//            self.setViewControllers([controller], direction: .forward, animated: true)
//        }, onCompleted: {
//            print("terminou")
//        }
//
//        ).disposed(by: disposeBag)
    }

}

extension OnboardingPageControlViewController: PresenterToViewOnboardingPageControlProtocol{
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



