//
//  HomeViewController.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: ViewToPresenterHomeProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true 
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



