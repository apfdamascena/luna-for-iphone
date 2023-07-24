//
//  LandingPageViewController.swift
//  luna
//
//  Created by gabrielfelipo on 21/07/23.
//  
//

import UIKit
import RxSwift
import RxCocoa

class LandingPageViewController: UIViewController {
    
    var presenter: ViewToPresenterLandingPageProtocol?
    
    let landingPageView = LandingPageView()
    
    private var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = landingPageView
        
        addUserTouchTrigger()
    }
    
    func addUserTouchTrigger() {
        landingPageView.startButton.rx.tap.bind{
            self.presenter?.userTappedContinue()
        }.disposed(by: disposeBag)
    }

}

extension LandingPageViewController: PresenterToViewLandingPageProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct LandingPageViewController_Preview: PreviewProvider {
    static var previews: some View {
        LandingPageViewController().showPreview()
    }
}

#endif



