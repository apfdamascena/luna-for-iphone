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

class OnboardingPageControlViewController: UIPageViewController,
                                           AnyView,
                                           TouchableUserEvent,
                                           DataSourceEventObservable {

    var presenter: ViewToPresenterOnboardingPageControlProtocol?
    private var datasource: OnboardingPageControlDataSource?
    
    private let onboardingButtons = OnboardingButtonView()
    private var disposeBag = DisposeBag()
    
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
    
    func addSubviews() {
        view.addSubview(onboardingButtons)
    }
    
    func addConstraints() {
        onboardingButtons.backgroundColor = .yellow
    
        onboardingButtons.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-2.su)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(7.su)
        }
    }
    
    func addUserTouchTrigger() {
        
        onboardingButtons.nextButton.rx.tap.bind {
            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
            self.datasource?.pageIndex.onNext(currentPage + 1)
        }.disposed(by: disposeBag)
        
        onboardingButtons.backButton.rx.tap.bind {
            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
            self.datasource?.pageIndex.onNext(currentPage - 1)
        }.disposed(by: disposeBag)
        
    }
    
    func addDataSourceEventObservable() {
        datasource?.pageIndex.subscribe(onNext: { pageIndex in
            guard let controller = self.datasource?.pages[pageIndex] else { return }
            self.setViewControllers([controller], direction: .forward, animated: true)
        }).disposed(by: disposeBag)
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



