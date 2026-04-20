//
//  Date+Extensions.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 20.04.26.
//

import Foundation

extension Date {
    func formattedTodayDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: self)
    }
    
    func formattedDate(with format: String = "d MMMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: self)
    }
}
