//
//  BestActivityViewController.swift
//  luna
//
//  Created by sml on 12/09/23.
//  
//

import UIKit
import RxSwift

class BestActivityViewController: UIViewController {
    
    var presenter: ViewToPresenterBestActivityProtocol?
    private let bestActivityView = BestActivityView()
    private var disposeBag = DisposeBag()
        
    override func loadView() {
        super.loadView()
        view = bestActivityView
        self.draw()
    }
    
    func draw() {
        let viewModel = BestActivityFactory.create(phase: NewActivityInformations.shared.phase, dates: NewActivityInformations.shared.dateInterval)
        bestActivityView.draw(viewModel)
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButtonTouchTrigger()
        let nav = self.navigationController?.navigationBar
        self.tabBarController?.tabBar.isHidden = true
        nav?.tintColor = Asset.red600.color
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func continueButtonTouchTrigger() {
        bestActivityView.button
            .rx
            .tap.bind {
                self.presenter?.userTappedContinueButton()
            }.disposed(by: disposeBag)
    }

}

extension BestActivityViewController: PresenterToViewBestActivityProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct BestActivityViewController_Preview: PreviewProvider {
    static var previews: some View {
        BestActivityViewController().showPreview()
    }
}

#endif



