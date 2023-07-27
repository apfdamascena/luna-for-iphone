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
        
        print(OnboardingUserCycleInformation.shared.cycleDuration,
              OnboardingUserCycleInformation.shared.lastMenstruation,
              OnboardingUserCycleInformation.shared.menstruationDuration
        )
        
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



