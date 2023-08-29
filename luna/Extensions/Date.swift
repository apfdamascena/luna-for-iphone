//
//  Date.swift
//  luna
//
//  Created by sml on 26/07/23.
//

import Foundation

extension Date {
    func daysBetween(_ endDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: endDate).day ?? -1
    }
    
    func daysBefore(_ numberOfDays: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -numberOfDays, to: self) ?? Date()
    }
    
    func daysAfter(_ numberOfDays: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: numberOfDays, to: self) ?? Date()
    }
    
    func formatToString() -> String {
        return self.formatted(date: .complete, time: .omitted)
    }
    
    func formatMonthToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: self)
        return month
    }
    
    func formatDayToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: self)
        return day
    }
    
    func formatDayOfTheWeekToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: self)
        return String(day.prefix(1))
    }
    
}
