//
//  UIViewController+Preview.swift
//  luna
//
//  Created by alexdamascena on 17/07/23.
//

import UIKit
import SwiftUI

extension UIViewController {
    
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        return Preview(viewController: self)
    }

}
