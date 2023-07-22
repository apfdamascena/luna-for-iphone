//
//  MenstruationDurationViewController.swift
//  luna
//
//  Created by alexdamascena on 20/07/23.
//  
//

import UIKit
import RxSwift

protocol MenstruationDurationDataSource {
    var elements: Observable<[[String]]> { get }
}

class MenstruationDurationDataSourceImpl: MenstruationDurationDataSource {
    var elements: Observable<[[String]]> = Observable.just([["1", "2", "3","4","5", "6","7", "8","9","10"]])
}

class MenstruationDurationViewController: UIViewController, DataSourceEventObservable {
    
    var presenter: ViewToPresenterMenstruationDurationProtocol?
    
    let menstruationDurationView = MenstruationDurationView()

    private let disposeBag = DisposeBag()
    private var datasource: MenstruationDurationDataSource?
    
    init(datasource: MenstruationDurationDataSource) {
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
        MenstruationDurationViewController(datasource: MenstruationDurationDataSourceImpl()).showPreview()
    }
}

#endif



