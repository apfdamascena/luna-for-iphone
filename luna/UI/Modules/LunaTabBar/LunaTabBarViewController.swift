//
//  LunaTabBarViewController.swift
//  luna
//
//  Created by alexdamascena on 06/09/23.
//

import UIKit



class LunaTabBarViewController: UITabBarController {
    
    private var controllers = [
        HomeRouter.createModule(),
        FirstTimeNewActivityRouter.createModule(),
        ReferencesViewController(), 
    ]
    
    private let icons = [
         ["calendar","calendar.fill"],
         ["plus", "plus.fill"],
         ["info.circle", "info.circle.fill"],
     ]
    
    private let titles: [String?]  = [
        L10n.Constants.Content.Tab.Bar.cycle,
        L10n.Constants.Content.Tab.Bar.activities,
        L10n.Constants.Content.Tab.Bar.fontes
    ]
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        addAdditionalConfiguration()
        
        
        self.tabBar.barTintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupViewControllers(){
        
        if ActivityManager.shared.wasSeen {
            controllers[1] = NewActivityRouter.createModule()
        }
        
        let navigationControllers = controllers.enumerated().map{ (index, viewController) in
            viewController.title = titles[index]
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = UITabBarItem(title: viewController.title,
                                                            image: UIImage(systemName: icons[index][0]),
                                                            selectedImage: UIImage(systemName: icons[index][1]))
            return navigationController
        }
        
        setViewControllers(navigationControllers, animated: false)
    }
    
    private func addAdditionalConfiguration(){
        tabBar.unselectedItemTintColor = Asset.gray400.color
        tabBar.tintColor = Asset.red500.color
        tabBar.barTintColor = Asset.gray50.color
    }

}
