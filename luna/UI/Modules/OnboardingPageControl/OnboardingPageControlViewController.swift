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

class OnboardingPageControlViewController: UIViewController,
                                           AnyView,
                                           TouchableUserEvent {
    
    var presenter: ViewToPresenterOnboardingPageControlProtocol?
    
    private var disposeBag = DisposeBag()
    
    
    private let onboardingButtons = OnboardingButtonView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
    }
    
    func addUserTouchTrigger() {
        
//        nextButton.rx.tap.bind{
//            print("oi oi")
//        }.disposed(by: disposeBag)
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
        OnboardingPageControlViewController().showPreview()
    }
}

#endif



