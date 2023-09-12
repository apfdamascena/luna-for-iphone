//
//  NewActivityViewController.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import UIKit
import RxSwift
import RxCocoa

class NewActivityViewController: UIViewController {
    
    private let newActivityView = NewActivityView()
    private let firstTimeNewActivityView = FirstTimeNewActivityView()
    
    
    private var disposeBag = DisposeBag()
    
    var presenter: ViewToPresenterNewActivityProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
//        view = newAcitvityView
        view = firstTimeNewActivityView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        firstTimeLetsGoButtonTouchTrigger()
    }
    
    func firstTimeLetsGoButtonTouchTrigger() {
        firstTimeNewActivityView.button
            .rx
            .tap.bind {
                print("clicou!!")
                self.presenter?.userTappedLetsGoButton()
            }.disposed(by: disposeBag)
    }

}

extension NewActivityViewController: PresenterToViewNewActivityProtocol{
    // TODO: Implement View Output Methods
}




