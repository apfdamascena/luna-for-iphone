//
//  BestActivityViewController.swift
//  luna
//
//  Created by sml on 12/09/23.
//  
//

import UIKit

class BestActivityViewController: UIViewController {
    
    var presenter: ViewToPresenterBestActivityProtocol?
    private let bestActivityView = BestActivityView()
        
    override func loadView() {
        super.loadView()
        view = bestActivityView
        self.draw()
    }
    
    func draw() {
        let viewModel = BestActivityFactory.create(phase: NewActivityInformations.shared.phase, dates: NewActivityInformations.shared.dateInterval)
        bestActivityView.draw(viewModel)
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // pode botar aq?
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = Asset.red600.color
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension BestActivityViewController: PresenterToViewBestActivityProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct BestActivityViewController_Preview: PreviewProvider {
    static var previews: some View {
        BestActivityViewController().showPreview()
    }
}

#endif



