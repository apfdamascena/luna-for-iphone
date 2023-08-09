//
//  ReferencesViewController.swift
//  luna
//
//  Created by gabrielfelipo on 08/08/23.
//

import UIKit

let referencesView = ReferencesSheetView()

class ReferencesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = referencesView
    }
}
