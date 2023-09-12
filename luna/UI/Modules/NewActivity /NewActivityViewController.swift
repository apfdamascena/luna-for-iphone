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
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = newActivityView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = L10n.Constants.Content.Label.NewActivity.Nav.title
    }
    
}

extension NewActivityViewController: PresenterToViewNewActivityProtocol{
    // TODO: Implement View Output Methods
}




