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
        guard let date =  UserDefaults.standard.object(forKey: "menstruation_date") as? Date else {
            return Date()
        }
        return date
    }
    
    var menstruationDuration: Int? {
        guard let duration = UserDefaults.standard.object(forKey: "menstruation_duration") as? Int else {
            return 5
        }
        
        return duration
    }
    
    var cycleDuration: Int? {
        guard let duration = UserDefaults.standard.object(forKey: "cycle_duration") as? Int else {
            return 28
        }
        return duration
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
