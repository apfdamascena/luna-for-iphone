//
//  LastDayMenstruationViewController.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//  
//

import UIKit
import RxSwift
import RxCocoa

class LastDayMenstruationViewController: UIViewController,
                                         TouchableUserEvent {

    var presenter: ViewToPresenterLastDayMenstruationProtocol?
    
    let lastDayMenstruationView = LastDayMenstruationView()
    
    private var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = lastDayMenstruationView
        
        addUserTouchTrigger()
    }
    
    func addUserTouchTrigger() {
//        lastDayMenstruationView.nextButton.rx.tap.bind{
//            self.presenter?.userTappedContinue()
//        }.disposed(by: disposeBag)
    }

}

extension LastDayMenstruationViewController: PresenterToViewLastDayMenstruationProtocol{
    
    
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct LastDayMenstruationViewController_Preview: PreviewProvider {
    static var previews: some View {
        LastDayMenstruationViewController().showPreview()
    }
}

#endif



