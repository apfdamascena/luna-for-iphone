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

class OnboardingPageControlViewController: UIViewController,
                                           AnyView,
                                           TouchableUserEvent {
    
    var presenter: ViewToPresenterOnboardingPageControlProtocol?
    private var disposeBag = DisposeBag()
    private let onboardingButtons = OnboardingButtonView()
    private var datasource: OnboardingPageControlDataSource?
    
    init(datasource: OnboardingPageControlDataSource){
        super.init(nibName: nil, bundle: nil)
        self.datasource = datasource
        
        addUserTouchTrigger()
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
    
    func addUserTouchTrigger() {
        
        onboardingButtons.nextButton.rx.tap.bind {
            guard let currentPage = try? self.datasource?.pageIndex.value() else { return }
            self.datasource?.pageIndex.onNext(currentPage + 1)
        }.disposed(by: disposeBag)
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



