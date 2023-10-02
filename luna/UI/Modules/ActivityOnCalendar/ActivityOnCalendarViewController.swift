//
//  ActivityOnCalendarViewController.swift
//  luna
//
//  Created by alexdamascena on 19/09/23.
//  
//

import UIKit
import RxSwift

class ActivityOnCalendarViewController: UIViewController {
    
    var presenter: ViewToPresenterActivityOnCalendarProtocol?
    
    private let activityOnCalendarView = ActivityOnCalendarView()
    
    private var disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = activityOnCalendarView
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        observerNewActivityButton()
        observerBackHomeButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    func observerBackHomeButton(){
        activityOnCalendarView.backToHome
            .rx
            .tap
            .bind{
                self.presenter?.userTapGoHome()
            }.disposed(by: disposeBag)
    }
    
    func observerNewActivityButton() {
        activityOnCalendarView.newActivity
            .rx
            .tap.bind {
                self.presenter?.userTapNewActivity()
            }.disposed(by: disposeBag)
    }

}

extension ActivityOnCalendarViewController: PresenterToViewActivityOnCalendarProtocol {
    
    // TODO: Implement View Output Methods
    
    func navigateToHomeView() {
        
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.selectedIndex = 0
        
        
        guard let tab = self.tabBarController as? LunaTabBarViewController else { return }

        tab.setupViewControllers()
        


    }
    
    
    func navigateToNewActivityView() {
        guard let tab = self.tabBarController as? LunaTabBarViewController else { return }
        tab.setupViewControllers()
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ActivityOnCalendarViewController_Preview: PreviewProvider {
    static var previews: some View {
        ActivityOnCalendarViewController().showPreview()
    }
}

#endif



