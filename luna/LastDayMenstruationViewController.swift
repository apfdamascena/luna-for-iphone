//
//  LastDayMenstruationViewController.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//  
//

import UIKit

class LastDayMenstruationViewController: UIViewController {
    
    var presenter: ViewToPresenterLastDayMenstruationProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

}

extension LastDayMenstruationViewController: PresenterToViewLastDayMenstruationProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct LastDayMenstruationViewController_Preview: PreviewProvider {
    static var previews: some View {
        LastDayMenstruationViewController().showPreview()
    }
}

#endif



