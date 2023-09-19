//
//  ActivityOnCalendarViewController.swift
//  luna
//
//  Created by alexdamascena on 19/09/23.
//  
//

import UIKit

class ActivityOnCalendarViewController: UIViewController {
    
    var presenter: ViewToPresenterActivityOnCalendarProtocol?
    
    private let activityOnCalendarView = ActivityOnCalendarView()
    
    override func loadView() {
        super.loadView()
        view = activityOnCalendarView
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ActivityOnCalendarViewController: PresenterToViewActivityOnCalendarProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ActivityOnCalendarViewController_Preview: PreviewProvider {
    static var previews: some View {
        ActivityOnCalendarViewController().showPreview()
    }
}

#endif



