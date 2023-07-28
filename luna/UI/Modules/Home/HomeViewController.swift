//
//  HomeViewController.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    var presenter: ViewToPresenterHomeProtocol?
    
    private var disposeBag = DisposeBag()
    
    private var lunaCalendarManager = LunaCalendarManager()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        checkUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true 
    }
    
    func checkUserData(){
        if !(lunaCalendarManager.lunaEventsExist()) {
            let firstDayMenstruation = OnboardingUserCycleInformation.shared.lastMenstruation ?? Date()
            let menstruationDuration = OnboardingUserCycleInformation.shared.menstruationDuration ?? 5
            let cycleDuration = OnboardingUserCycleInformation.shared.cycleDuration ?? 28
            lunaCalendarManager.firstLoadElementsToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: menstruationDuration, averageCycleDuration: cycleDuration)
            print(firstDayMenstruation, menstruationDuration, cycleDuration)
        }
       
 

//        lunaCalendarManager.firstLoadElementsToCalendar(firstDayMenstruation: firstDayMenstruation, averageMenstruationDuration: menstruationDuration, averageCycleDuration: cycleDuration)
    }

}

extension HomeViewController: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewController().showPreview()
    }
}

#endif



