//
//  OtherCyclePhasesViewController.swift
//  luna
//
//  Created by alexdamascena on 30/07/23.
//  
//

import UIKit

class OtherCyclePhasesViewController: UIViewController {
    
    var presenter: ViewToPresenterOtherCyclePhasesProtocol?
    
    private let otherCyclePhaseView = OtherCyclePhasesView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = otherCyclePhaseView
    }

}

extension OtherCyclePhasesViewController: PresenterToViewOtherCyclePhasesProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct OtherCyclePhasesViewController_Preview: PreviewProvider {
    static var previews: some View {
        OtherCyclePhasesViewController().showPreview()
    }
}

#endif



