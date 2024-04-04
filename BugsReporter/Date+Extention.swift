//
//  Date+Extention.swift
//  EmployeeID
//
//  Created by Reenad gh on 22/07/1444 AH.
//

import Foundation

extension Date {
    /// To conver date from string to Date
    func dateStringToDate(dateString: String) -> Date? { //"2022-12-20T13:54:52"
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
    return dateFormatter.date(from: dateString)
}
    
    /// To convert a date to specific type
    func convertDate(_ formattedString: DateFormattedType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formattedString.rawValue
        formatter.locale = Locale(identifier: "en")
        return formatter.string(from: self)
    }
    func numberOfDaysInMonth() -> Int? {
         let calendar = Calendar.current
         let components = calendar.dateComponents([.year, .month], from: self)
         if let date = calendar.date(from: components),
            let range = calendar.range(of: .day, in: .month, for: date) {
             return range.count
         } else {
             return nil
         }
     }
    static func from(year: Int, month: Int, day: Int) -> Date? {
         let calendar = Calendar(identifier: .gregorian)
         var dateComponents = DateComponents()
         dateComponents.year = year
         dateComponents.month = month
         dateComponents.day = day
         return calendar.date(from: dateComponents) ?? nil
     }
    
    func daysRemainingUntilDate(_ targetDate: Date) -> Int {
           let calendar = Calendar.current
           let components = calendar.dateComponents([.day], from: self, to: targetDate)
           // Extract the number of days from the components
           if let daysRemaining = components.day {
               return daysRemaining
           } else {
               return 0
           }
       }
}

enum DateFormattedType: String, CaseIterable {

    case formattedType1 = "dd-MM-yy"
 
}
