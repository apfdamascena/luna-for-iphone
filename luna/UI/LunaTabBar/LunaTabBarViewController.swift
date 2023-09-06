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
        LandingPageRouter.createModule(),
        LandingPageRouter.createModule(),
    ]
    
    private let icons = [
         ["house","house.fill"],
         ["heart", "heart.fill"],
         ["clock.arrow.circlepath", "clock.arrow.circlepath"],
     ]
    
    private let titles = [
        "Home",
        "Home",
        "Home"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        addAdditionalConfiguration()
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
        tabBar.unselectedItemTintColor = .orange
        tabBar.tintColor = .blue
    }
    

}
