//
//  MenstruationDurationViewController.swift
//  luna
//
//  Created by alexdamascena on 20/07/23.
//  
//

import UIKit

class MenstruationDurationViewController: UIViewController {
    
    var presenter: ViewToPresenterMenstruationDurationProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MenstruationDurationViewController: PresenterToViewMenstruationDurationProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MenstruationDurationViewController_Preview: PreviewProvider {
    static var previews: some View {
        MenstruationDurationViewController().showPreview()
    }
}

#endif



