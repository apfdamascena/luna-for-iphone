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
    var elements: Observable<[[String]]> { get }
}

class RangePickerViewDataSourceImpl: RangePickerViewDataSource {
    var elements: Observable<[[String]]>
    
    init(range: ClosedRange<Int>) {
        let opa = range.map{ element in
            return String(element)
        }
        self.elements = Observable.just([opa])
    }
}

class MenstruationDurationViewController: UIViewController, DataSourceEventObservable {
    
    var presenter: ViewToPresenterMenstruationDurationProtocol?
    
    let menstruationDurationView = MenstruationDurationView()

    private let disposeBag = DisposeBag()
    private var datasource: RangePickerViewDataSource?
    
    init(datasource: RangePickerViewDataSource) {
        super.init(nibName: nil, bundle: nil)
        self.datasource = datasource
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
        menstruationDurationView.picker.selectRow(5, inComponent: 0, animated: true)

        datasource?.elements
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
        MenstruationDurationViewController(datasource: RangePickerViewDataSourceImpl(range: 1...20)).showPreview()
    }
}

#endif



