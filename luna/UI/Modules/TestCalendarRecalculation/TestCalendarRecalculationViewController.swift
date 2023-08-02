//
//  TestCalendarRecalculationViewController.swift
//  luna
//
//  Created by sml on 28/07/23.
//  
//

import UIKit
import RxSwift

class TestCalendarRecalculationViewController: UIViewController, DataSourceEventObservable {
    
    var presenter: ViewToPresenterTestCalendarRecalculationProtocol?
    
    let testCalendarRecalculationView = TestCalendarRecalculationView()
    private var disposeBag = DisposeBag()
    private let lunaCalendarManager = LunaCalendarManager()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = testCalendarRecalculationView
        addDataSourceEventObservable()
    }
    
    func addDataSourceEventObservable() {
        testCalendarRecalculationView.datePicker
            .rx.value.changed.asObservable()
            .subscribe(onNext: { date in
                if self.lunaCalendarManager.hasMenstruationInCycle(menstruationDate: date) {
                }
//                self.lunaCalendarManager.adjustEventsInCalendarBy(menstruationDate: date)
            }).disposed(by: disposeBag)
    }

}

extension TestCalendarRecalculationViewController: PresenterToViewTestCalendarRecalculationProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TestCalendarRecalculationViewController_Preview: PreviewProvider {
    static var previews: some View {
        TestCalendarRecalculationViewController().showPreview()
    }
}

#endif



