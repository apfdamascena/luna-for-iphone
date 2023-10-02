//
//  LunaCalendarViewController.swift
//  luna
//
//  Created by alexdamascena on 29/09/23.
//

import UIKit
import EventKitUI

class LunaCalendarViewController: EKEventEditViewController {

    let root: HomeViewController
    
    init(with parent: HomeViewController){
        self.root = parent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        root.presenter?.loadActivitiesDataSource()
    }
}
