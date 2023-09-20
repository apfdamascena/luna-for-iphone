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
    
    func formatToInt() -> Int {
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        
        let date = yearFormatter.string(from: self) + monthFormatter.string(from: self)  + dayFormatter.string(from: self)
        return Int(date) ?? -1
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
    
    func startOfMonth() -> Date {
      return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
  
    func endOfMonth() -> Date {
      return Calendar.current.date(byAdding: DateComponents(month: 1, day: 0), to: self.startOfMonth())!
    }
    
    func formattHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }

    func endOfWeek() -> Date {
       let gregorian = Calendar(identifier: .gregorian)
       let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        return gregorian.date(byAdding: .day, value: 7, to: sunday ?? Date()) ?? Date()
   }
}
