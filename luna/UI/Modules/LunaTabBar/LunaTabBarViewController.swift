//
//  LunaTabBarViewController.swift
//  luna
//
//  Created by alexdamascena on 06/09/23.
//

import UIKit

class LunaTabBarViewController: UITabBarController {
    
    private let controllers = [
        HomeRouter.createModule(),
        FirstTimeNewActivityRouter.createModule(),
        ActivityOnCalendarRouter.createModule(), 
    ]
    
    private let icons = [
         ["calendar","calendar.fill"],
         ["plus", "plus.fill"],
         ["info.circle", "info.circle.fill"],
     ]
    
    private let titles: [String?]  = [
        "Ciclo",
        "Atividades",
        "Fontes"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        addAdditionalConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupViewControllers(){
        let navigationControllers = controllers.enumerated().map{ (index, viewController) in
            viewController.title = titles[index]
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = UITabBarItem(title: viewController.title,
                                                            image: UIImage(systemName: icons[index][0]),
                                                            selectedImage: UIImage(systemName: icons[index][1]))
            return navigationController
        }
        
        setViewControllers(navigationControllers, animated: true)
    }
    
    private func addAdditionalConfiguration(){
        tabBar.unselectedItemTintColor = Asset.gray400.color
        tabBar.tintColor = Asset.red500.color
    }

}
