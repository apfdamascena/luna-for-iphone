//
//  TesteView.swift
//  luna
//
//  Created by Cynara Costa on 26/07/23.
//

import UIKit

class TesteView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
//        let back = CreateButton.draw(type: .back, frame: CGRect(x: 50, y: 100, width: 150, height: 50))
        let back2 = CreateButton.draw(type: .back, frame: CGRect(x: 50, y: 100, width: 85, height: 27))
        let proceed = CreateButton.draw(type: .proceed, frame: CGRect(x: 50, y: 500, width: 163, height: 50))
        
        view.addSubview(back2 as! UIView)
        view.addSubview(proceed as! UIView)
        
    }
}



