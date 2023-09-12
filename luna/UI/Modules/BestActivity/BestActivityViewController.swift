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
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
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



