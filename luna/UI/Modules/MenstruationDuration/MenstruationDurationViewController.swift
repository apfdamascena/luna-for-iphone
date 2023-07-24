//
//  MenstruationDurationViewController.swift
//  luna
//
//  Created by alexdamascena on 20/07/23.
//  
//

import UIKit
import RxSwift

protocol RangePickerViewDataSource {
    var elements: [[String]] { get }
}

class RangePickerViewDataSourceImpl: RangePickerViewDataSource {
    var elements: [[String]]
    
    init(range: ClosedRange<Int>) {
        let opa = range.map{ element in
            return String(element)
        }
        self.elements = [opa]
    }
}

class MenstruationDurationViewController: UIViewController, DataSourceEventObservable {
    
    var presenter: ViewToPresenterMenstruationDurationProtocol?
    
    let menstruationDurationView = MenstruationDurationView()

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
        view = menstruationDurationView
        addDataSourceEventObservable()
    }
    
    func addDataSourceEventObservable() {
        Observable.just(datasource.elements)
            .bind(to: menstruationDurationView.picker.rx.items(adapter: PickerViewAdapter()))
            .disposed(by: disposeBag)
        menstruationDurationView.picker.selectRow(5004, inComponent: 0, animated: true)

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
        MenstruationDurationViewController(datasource: RangePickerViewDataSourceImpl(range: 1...30)).showPreview()
    }
}

#endif



