//
//  NewActivityPresenter.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import Foundation
import EventKit

class NewActivityPresenter: ViewToPresenterNewActivityProtocol {

    var view: PresenterToViewNewActivityProtocol?
    var interactor: PresenterToInteractorNewActivityProtocol?
    var router: PresenterToRouterNewActivityProtocol?
    
    func userTappedContinueButton() {
        
        guard let pageViewController = view else { return }        
        DispatchQueue.main.async {
            self.router?.pushNewActivity(on: pageViewController)
        }
        
    }
    
    func findBestPhase(activity: ActivityMetrics) -> EKEvent {
        guard let idealPhase = interactor?.findBestPhaseFor(activity: activity) else {
            return EKEvent()
        }
        
        return idealPhase
    }
    
    func fieldsWereNotFilled(_ value: LabelsNotFilled) {
        let text = value == .metrics ? "Adicione as métricas para a sua atividade" : L10n.Constants.Content.Alert.Warning.noTitleActivity
        view?.showFeedbackForUser(with: text)
    }
    
}

extension NewActivityPresenter: InteractorToPresenterNewActivityProtocol {
    
}
