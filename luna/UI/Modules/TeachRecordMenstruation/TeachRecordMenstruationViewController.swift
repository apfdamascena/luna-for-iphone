//
//  TeachRecordMenstruationViewController.swift
//  luna
//
//  Created by alexdamascena on 28/07/23.
//  
//

import UIKit

class TeachRecordMenstruationViewController: UIViewController {
    
    var presenter: ViewToPresenterTeachRecordMenstruationProtocol?
    
    let teachRecordMenstruationView = TeachRecordMenstruationView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view = teachRecordMenstruationView
    }

}

extension TeachRecordMenstruationViewController: PresenterToViewTeachRecordMenstruationProtocol{
    // TODO: Implement View Output Methods
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TeachRecordMenstruationViewController_Preview: PreviewProvider {
    static var previews: some View {
        TeachRecordMenstruationViewController().showPreview()
    }
}

#endif



