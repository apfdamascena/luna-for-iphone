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

enum LabelsNotFilled {

    case title
    case metrics
}

class NewActivityViewController: UIViewController {
    
    private let newActivityView = NewActivityView()
    
    var presenter: ViewToPresenterNewActivityProtocol?
    
    var stressValue: String = ""
    var sociabilityValue: String = ""
    var fisicsEffortValue: String = ""
    var dateActivity: Date = Date().daysAfter(10)
    var titleActivity: String = ""
    
    private var disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = newActivityView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstTimeContinueButtonTouchTrigger()
        dateDeadlineObservable()
        textActivityObservable()
        selectedStressCollectionNumber()
        selectedSociabilityCollectionNumber()
        selectedFisicsCollectionNumber()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.tabBarController?.tabBar.isHidden = false
        self.title = L10n.Constants.Content.Label.NewActivity.Nav.title
        
        self.dismissKeyboard()
    }
    
    func textActivityObservable() {
        newActivityView.activityStack.activityTextField
            .rx.value.changed.asObservable()
            .subscribe(onNext: { title in
                self.titleActivity = title ?? ""
            }).disposed(by: disposeBag)
    }
    
    func dateDeadlineObservable() {
        newActivityView.datePickerStack.datePicker
            .rx.value.changed.asObservable()
            .subscribe(onNext: { date in
                self.dateActivity = date
            }).disposed(by: disposeBag)
    }
    
    func firstTimeContinueButtonTouchTrigger() {
        newActivityView.button
            .rx
            .tap.bind {
                guard self.titleActivity != "" else {
                    self.presenter?.fieldsWereNotFilled(.title)
                    return
                }
                
                guard self.allUsersLabelsWereFilled() else { return }
                
                self.idealPhase(
                    stress: self.stressValue,
                    sociability: self.sociabilityValue,
                    fisicalEffort: self.fisicsEffortValue,
                    finalDate: self.dateActivity
                )
                self.presenter?.userTappedContinueButton()
            }.disposed(by: disposeBag)
    }
    
    func allUsersLabelsWereFilled() -> Bool {
        let filled = [stressValue, sociabilityValue, fisicsEffortValue].reduce(true) { partialResult, value in
            return partialResult && value != ""
        }
        return filled
    }
    
    func selectedStressCollectionNumber() {
        newActivityView.metricsComponent.stressCollectionView
            .rx.selectItemAtCollection
            .subscribe(onNext: { numberSelected in
                self.stressValue = numberSelected ?? "0"
            }).disposed(by: disposeBag)
            
    }
    
    func selectedSociabilityCollectionNumber() {
        newActivityView.metricsComponent.sociabilityCollectionView
            .rx.selectItemAtCollection
            .subscribe(onNext: { numberSelected in
                self.sociabilityValue = numberSelected ?? "0"
            }).disposed(by: disposeBag)
    }
    
    func selectedFisicsCollectionNumber() {
        newActivityView.metricsComponent.fisicsCollectionView
            .rx.selectItemAtCollection
            .subscribe(onNext: { numberSelected in
                self.fisicsEffortValue = numberSelected ?? "0"
            }).disposed(by: disposeBag)
    }
    
    func idealPhase(stress: String, sociability: String, fisicalEffort: String, finalDate: Date) {
        let stressInt = stress.toInt()
        let sociabilityInt = sociability.toInt()
        let fisicalEffortInt = fisicalEffort.toInt()
        let idealEvent = presenter?.findBestPhase(
            activity: ActivityMetrics(
                stress: stressInt,
                sociability: sociabilityInt,
                fisicalEffort: fisicalEffortInt,
                finalDate: finalDate
            )
        )
        let idealEventTitle = idealEvent?.title ?? "Default"
        let cyclePhase = CyclePhase(rawValue: idealEventTitle) ?? .none
        NewActivityInformations.shared.setBestPhase(cyclePhase)
        
        if idealEvent?.startDate ?? Date() < Date() {
            idealEvent?.startDate = Date()
        }
        if idealEvent?.endDate ?? Date() > finalDate {
            idealEvent?.endDate = finalDate
        }
        
        NewActivityInformations.shared.setDateInterval(DateInterval(start: (idealEvent?.startDate)!, end: (idealEvent?.endDate)!))
        
        NewActivityInformations.shared.title = self.titleActivity
    }
    
}

extension NewActivityViewController: PresenterToViewNewActivityProtocol{
    
    func showFeedbackForUser(with text: String) {
        
        let alert = UIAlertController(title: L10n.Constants.Content.Alert.Warning.title,
                                      message: L10n.Constants.Content.Alert.Warning.noTitleActivity,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in
        }))

        present(alert, animated: true, completion: nil)
    }
    
    // TODO: Implement View Output Methods
}






