//
//  CalendarViewController.swift
//  luna
//
//  Created by Cynara Costa on 21/07/23.
//  
//

import UIKit

class CalendarViewController: UIViewController {
    
    var presenter: ViewToPresenterCalendarProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension CalendarViewController: PresenterToViewCalendarProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CalendarViewController_Preview: PreviewProvider {
    static var previews: some View {
        CalendarViewController().showPreview()
    }
}

#endif



