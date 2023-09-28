//
//  RefreshToken.swift
//  luna
//
//  Created by sml on 28/09/23.
//


import Foundation

class RefreshToken {
    static let shared = RefreshToken()
    
    private init(){}
    
    var isNotRefreshed: Bool {
        return UserDefaults.standard.object(forKey: "refresh_token_v1.4") == nil
    }
    
    func calendarReloaded() {
        UserDefaults.standard.set("v1.4", forKey: "refresh_token_v1.4")
    }
    
}
