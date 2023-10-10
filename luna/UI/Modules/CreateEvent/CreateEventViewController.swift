//
//  CreateEventViewController.swift
//  luna
//
//  Created by sml on 20/09/23.
//  
//

import UIKit
import RxSwift

class CreateEventViewController: UIViewController {
    
    var presenter: ViewToPresenterCreateEventProtocol?
    
    private var disposeBag = DisposeBag()
    
    private let createEventView = CreateEventView()
    
    var titleEvent: String = NewActivityInformations.shared.title
    var initialDate: Date = NewActivityInformations.shared.dateInterval.start
    var endDate: Date = NewActivityInformations.shared.dateInterval.end

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialDateObservable()
        endDateObservable()
        textActivityObservable()
        createEventButtonTouchTrigger()

        self.navigationItem.setHidesBackButton(false, animated: true)
        
        self.navigationItem.title = L10n.Constants.Content.Label.CreateEvent.Nav.title
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = Asset.red600.color
        self.dismissKeyboard()
    }
    
    func draw() {
        
        let viewModel = CreateEventViewModel(eventName: NewActivityInformations.shared.title, dateInterval: NewActivityInformations.shared.dateInterval)
        createEventView.draw(viewModel)
    }
    
    override func loadView() {
        super.loadView()
        view = createEventView
        self.draw()
    }
    
    func createEventButtonTouchTrigger() {
        createEventView.createEventButton
            .rx
            .tap.bind {
                if self.initialDate > self.endDate {
                    let alert = UIAlertController(title: L10n.Constants.Content.Alert.Warning.warning,
                                                  message: L10n.Constants.Content.Alert.Warning.initialDateAfter,
                                                  preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "OK",
                                                  style: .default,
                                                  handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)

                } else {
                    self.initialDate = self.initialDate + 1
                    
                    if self.titleEvent == "" {
                        self.titleEvent = NewActivityInformations.shared.title
                    }
                    
                    self.addActivity(title: self.titleEvent, initialDate: self.initialDate, finalDate: self.endDate)
                    self.presenter?.userTappedCreateEventButton()
                }
                    
            }.disposed(by: disposeBag)
    }
    
    func initialDateObservable() {
        createEventView.datePickers.initialDatePicker
            .rx.value.changed.asObservable()
            .subscribe(onNext: { date in
                self.initialDate = date
            }).disposed(by: disposeBag)
    }
    
    func endDateObservable() {
        createEventView.datePickers.finalDatePicker
            .rx.value.changed.asObservable()
            .subscribe(onNext: { date in
                self.endDate = date
            }).disposed(by: disposeBag)
    }
    
    func textActivityObservable() {
        createEventView.activityTextField
            .rx.value.changed.asObservable()
            .subscribe(onNext: { title in
                self.titleEvent = title ?? NewActivityInformations.shared.title
            }).disposed(by: disposeBag)
    }
    
    func addActivity(title: String, initialDate: Date, finalDate: Date) {
        presenter?.insertActivity(title: title, initialDate: initialDate, finalDate: finalDate)
    }

}

extension CreateEventViewController: PresenterToViewCreateEventProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CreateEventViewController_Preview: PreviewProvider {
    static var previews: some View {
        CreateEventViewController().showPreview()
    }
}

#endif



