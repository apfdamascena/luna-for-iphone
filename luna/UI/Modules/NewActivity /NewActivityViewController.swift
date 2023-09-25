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
                self.idealPhase(
                    stress: self.stressValue,
                    sociability: self.sociabilityValue,
                    fisicalEffort: self.fisicsEffortValue,
                    finalDate: self.dateActivity
                )
                self.presenter?.userTappedContinueButton()
            }.disposed(by: disposeBag)
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
        NewActivityInformations.shared.setDateInterval(DateInterval(start: (idealEvent?.startDate)!, end: (idealEvent?.endDate)!))
    }
    
}

extension NewActivityViewController: PresenterToViewNewActivityProtocol{
    // TODO: Implement View Output Methods
}

extension UINavigationController
{
    func addCustomBottomLine(color: UIColor,height: Double)
    {
        //Hiding Default Line and Shadow
        navigationBar.setValue(true, forKey: "hidesShadow")

        //Creating New line
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        lineView.backgroundColor = color
        navigationBar.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor.constraint(equalTo: navigationBar.widthAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        lineView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
    }
}




