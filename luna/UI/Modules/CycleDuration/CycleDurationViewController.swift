//
//  CycleDurationViewController.swift
//  luna
//
//  Created by sml on 24/07/23.
//  
//

import UIKit
import RxSwift


class CycleDurationViewController: UIViewController, DataSourceEventObservable {
    
    var presenter: ViewToPresenterCycleDurationProtocol?
    
    let cycleDurationView = CycleDurationView()

    private let disposeBag = DisposeBag()
    private var datasource: RangePickerViewDataSource
    
    init(datasource: RangePickerViewDataSource) {
        self.datasource = datasource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = cycleDurationView
        addDataSourceEventObservable()
    }
    
    func addDataSourceEventObservable() {
        Observable.just(datasource.elements)
            .bind(to: cycleDurationView.picker.rx.items(adapter: PickerViewAdapter()))
            .disposed(by: disposeBag)
        cycleDurationView.picker.selectRow(5004, inComponent: 0, animated: true)
        
        
        cycleDurationView.picker
            .rx.itemSelected.asObservable()
            .subscribe { (row: Int, _) in
                guard let duration = Int(self.datasource.elements[0][row%20]) else { return }
                OnboardingUserCycleInformation.shared.setCycle(duration)
//                OnboardingUserCycleInformation.shared.cycleDuration.onNext(duration)
            }.disposed(by: disposeBag)
    }

}

extension CycleDurationViewController: PresenterToViewCycleDurationProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CycleDurationViewController_Preview: PreviewProvider {
    static var previews: some View {
        CycleDurationViewController(datasource: RangePickerViewDataSourceImpl(range: 1...20)).showPreview()
    }
}

#endif



