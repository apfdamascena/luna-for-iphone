//
//  OnboardingUserCycleInformation.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//

import Foundation


class OnboardingUserCycleInformation {
    
    private init(){}
    static let shared = OnboardingUserCycleInformation()
    
    var lastMenstruation: Date? {
        return UserDefaults.standard.object(forKey: "menstruation_date") as? Date
    }
    
    var menstruationDuration: Int? {
        return UserDefaults.standard.object(forKey: "menstruation_duration") as? Int
    }
    
    var cycleDuration: Int? {
        return UserDefaults.standard.object(forKey: "cycle_duration") as? Int
    }
    

    func setLastMenstruation(_ date: Date){
        UserDefaults.standard.set(date, forKey: "menstruation_date")
    }
    
    func setMenstruation(_ duration: Int){
        UserDefaults.standard.set(duration, forKey: "menstruation_duration")
    }
    
    func setCycle(_ duration: Int){
        UserDefaults.standard.set(duration, forKey: "cycle_duration")
    }
}
