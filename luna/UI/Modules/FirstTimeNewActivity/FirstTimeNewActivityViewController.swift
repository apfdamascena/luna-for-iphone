//
//  FirstTimeNewActivityViewController.swift
//  luna
//
//  Created by Cynara Costa on 12/09/23.
//  
//

import UIKit
import RxSwift
import RxCocoa

class FirstTimeNewActivityViewController: UIViewController {
    
    var presenter: ViewToPresenterFirstTimeNewActivityProtocol?
    
    private let firstTimeNewActivityView = FirstTimeNewActivityView()
    
    private var disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil , bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = firstTimeNewActivityView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTimeLetsGoButtonTouchTrigger()
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.title = nil
        ActivityManager.shared.userSawActivities()
    }
        
    func firstTimeLetsGoButtonTouchTrigger() {
        firstTimeNewActivityView.button
            .rx
            .tap.bind {
                self.presenter?.userTappedLetsGoButton()
            }.disposed(by: disposeBag)
    }
}

extension FirstTimeNewActivityViewController: PresenterToViewFirstTimeNewActivityProtocol{
    // TODO: Implement View Output Methods
}




