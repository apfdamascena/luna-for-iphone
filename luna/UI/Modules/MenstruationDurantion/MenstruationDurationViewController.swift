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
            Observable.just(["1","2", "3","4","5", "6","7", "8","9","10"])
            .bind(to: menstruationDurationView.picker.rx.itemTitles) { _, item in
                    return "\(item)"
             }.disposed(by: disposeBag)

        menstruationDurationView.picker.rx.itemSelected.asObservable().subscribe(onNext: {item in

                //item.row gives you the index of the selected item, so do what you need with                  it

                //also here you can call .resignFirstResponder() on whatever element brought up the pickerview (e.g. a button) in order to close the pickerview

            }).disposed(by: disposeBag)

        menstruationDurationView.picker.selectRow(4, inComponent: 0, animated: true)

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



