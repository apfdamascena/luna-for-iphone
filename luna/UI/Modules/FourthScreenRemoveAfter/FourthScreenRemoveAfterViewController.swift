//
//  FourthScreenRemoveAfterViewController.swift
//  luna
//
//  Created by alexdamascena on 24/07/23.
//  
//

import UIKit

class FourthScreenRemoveAfterViewController: UIViewController {
    
    var presenter: ViewToPresenterFourthScreenRemoveAfterProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}

extension FourthScreenRemoveAfterViewController: PresenterToViewFourthScreenRemoveAfterProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct FourthScreenRemoveAfterViewController_Preview: PreviewProvider {
    static var previews: some View {
        FourthScreenRemoveAfterViewController().showPreview()
    }
}

#endif



