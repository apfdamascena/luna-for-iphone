//
//  MenstruationDurationViewController.swift
//  luna
//
//  Created by alexdamascena on 20/07/23.
//  
//

import UIKit
import RxSwift

class MenstruationDurationViewController: UIViewController {
    
    var presenter: ViewToPresenterMenstruationDurationProtocol?
    
    let menstruationDurationView = MenstruationDurationView()

    let disposeBag = DisposeBag()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menstruationDurationView
        setupRx()
    }
    
    func setupRx() {
        Observable.just([["1", "2", "3","4","5", "6","7", "8","9","10"]])
            .bind(to: menstruationDurationView.picker.rx.items(adapter: PickerViewAdapter()))
            .disposed(by: disposeBag)
    }

}

extension MenstruationDurationViewController: PresenterToViewMenstruationDurationProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI
import RxSwift

@available(iOS 13, *)
struct MenstruationDurationViewController_Preview: PreviewProvider {
    static var previews: some View {
        MenstruationDurationViewController().showPreview()
    }
}

#endif



