//
//  String.swift
//  luna
//
//  Created by Cynara Costa on 29/08/23.
//

import UIKit

extension String {
    func checkInternationalization(_ day: String, _ month: String) -> String {
        if (Locale.current.language.languageCode?.identifier != "pt") {
            return  ("\(month), \(day)")
        } else {
            return ("\(day) de \(month)")
        }
    }
}
