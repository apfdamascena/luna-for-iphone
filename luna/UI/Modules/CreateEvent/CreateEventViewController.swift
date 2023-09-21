//
//  CreateEventViewController.swift
//  luna
//
//  Created by sml on 20/09/23.
//  
//

import UIKit

class CreateEventViewController: UIViewController {
    
    var presenter: ViewToPresenterCreateEventProtocol?
    private let createEventView = CreateEventView()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    
    override func loadView() {
        super.loadView()
        view = createEventView
    }

}

extension CreateEventViewController: PresenterToViewCreateEventProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CreateEventViewController_Preview: PreviewProvider {
    static var previews: some View {
        CreateEventViewController().showPreview()
    }
}

#endif



