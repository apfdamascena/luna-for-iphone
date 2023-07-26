//
//  OnboardingPageFlowViewController.swift
//  luna
//
//  Created by alexdamascena on 25/07/23.
//  
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa


class OnboardingPageFlowViewController: UIPageViewController,
                                        AnyView,
                                        TouchableUserEvent,
                                        DataSourceEventObservable {
    
    var presenter: ViewToPresenterOnboardingPageFlowProtocol?
    
    private(set) var datasource: OnboardingPageControlDataSource
    
    private(set) var flow: OnboardingViewFlow?
    
    private let onboardingButtons = OnboardingButtonView()
    
    private var disposeBag = DisposeBag()
    
    private(set) var pageControl: OnboardingPageControl

    init(datasource: OnboardingPageControlDataSource){
        
        self.pageControl = OnboardingPageControl(numberOfPages: 4)
        self.flow = OnboardingViewFlow(numberOfPages: 4)
        
        self.datasource = datasource
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
      
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
        self.navigationItem.hidesBackButton = true
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
        addUserTouchTriggerForNextButton()
        addUserTouchTriggerForPreviousButton()
        addUserTouchTriggerForEndOnboardingButton()
    }
    
    func addDataSourceEventObservable() {
        
        Observable.zip(self.datasource.direction, self.datasource.pageIndex)
            .asObservable()
            .subscribe( onNext: { direction, index in
                let controller = self.datasource.pages[index]
                self.setViewControllers([controller], direction: direction, animated: true)
            }, onCompleted: {
                self.presenter?.userTappedEndOnboardingButton()
            })
            .disposed(by: disposeBag)
    }
    
    func addUserTouchTriggerForNextButton(){
        
        onboardingButtons.nextButton.rx.tap.bind {
            guard let currentPage = try? self.datasource.pageIndex.value() else { return }
            self.presenter?.userTappedOnboardingNextButton(at: currentPage)

//             lets try to sndo to interactor
            
//            interactor: api, core data, busniess logic
//            guard let currentPage = try? self.datasource.pageIndex.value() else { return }

//            guard let nextPage = self.flow?.change(newCurrentPage: currentPage + 1) else { return }

//            if nextPage == 3 {
//                self.presenter?.hideContinueAndBackButton()
//                self.presenter?.showLastContinueButton()
//            }

//            self.datasource.pageIndex.onNext(nextPage)
//            self.datasource.direction.onNext(.forward)
//            self.presenter?.completeOnboardFlowDot(at: nextPage)
    
        }.disposed(by: disposeBag)
    }
    
    func addUserTouchTriggerForPreviousButton(){
        onboardingButtons.previousButton.rx.tap.bind {
            guard let currentPage = try? self.datasource.pageIndex.value() else { return }
//            guard let previousPage = self.flow?.change(newCurrentPage: currentPage - 1) else { return }
            
//            self.datasource.pageIndex.onNext(previousPage)
//            self.datasource.direction.onNext(.reverse)
//            self.presenter?.onboardingFlowDotViewFor(previousPage)
            
        }.disposed(by: disposeBag)
    }
    
    func addUserTouchTriggerForEndOnboardingButton(){
        onboardingButtons.endOnboardingButton.rx.tap.bind {
            self.presenter?.userTappedEndOnboardingButton()
        }.disposed(by: disposeBag)
    }
}

extension OnboardingPageFlowViewController: PresenterToViewOnboardingPageFlowProtocol{

    
    // TODO: Implement View Output Methods
    
    func completeOnboardFlowDot(at currentPage: Int) {
        pageControl.completeDotAt(currentPage)
    }
    
    func hideContinueAndBackButton() {
        onboardingButtons.previousButton.isHidden = true
        onboardingButtons.nextButton.isHidden = true
    }
    
    func showLastContinueButton() {
        onboardingButtons.endOnboardingButton.isHidden = false
    }
    
    func goToNextPage(_ page: Int) {
        print("tá chegando aqui")
        self.datasource.pageIndex.onNext(page)
        self.datasource.direction.onNext(.forward)
        self.presenter?.onboardingFlowDotViewFor(page)
        
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct OnboardingPageFlowViewController_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingPageFlowViewController(datasource: OnboardingPageControlDataSourceImpl()).showPreview()
    }
}

#endif



