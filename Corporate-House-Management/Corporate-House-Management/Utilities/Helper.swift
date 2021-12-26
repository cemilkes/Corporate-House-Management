//
//  Helper.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/25/21.
//

import UIKit

extension Date {
    
    func getCalendarYear() -> String {
        let date = Date()
        let calendar = Calendar.current
        let component  = calendar.dateComponents([.year], from: date)
        let year = component.year
        
        return "\(year!)"
    }

    
    func getCalendarMonth() -> String {
        let date = Date()
        let calendar = Calendar.current
        let component = calendar.dateComponents([.month], from: date)
        let month = component.month
        
        return "\(month!)"
    }
 
    
    func getCalendarDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, E"
        let calendarDate = dateFormatter.string(from: date)
        return calendarDate
    }
    
}
