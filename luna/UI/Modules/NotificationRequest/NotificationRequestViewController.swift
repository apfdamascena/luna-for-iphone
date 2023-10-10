//
//  NotificationRequestViewController.swift
//  luna
//
//  Created by alexdamascena on 15/09/23.
//  
//

import UIKit

class NotificationRequestViewController: UIViewController {
    
    var presenter: ViewToPresenterNotificationRequestProtocol?
    
    private let notificationRequestView = NotificationRequestView()
    
    override func loadView() {
        super.loadView()
        view = notificationRequestView
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        DispatchQueue.main.async {
            self.presenter?.removeCalendar()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // O PROBLEMA TA AQUI
        Notification.shared.requestAccess()
    }
}

extension NotificationRequestViewController: PresenterToViewNotificationRequestProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct NotificationRequestViewController_Preview: PreviewProvider {
    static var previews: some View {
        NotificationRequestViewController().showPreview()
    }
}

#endif



