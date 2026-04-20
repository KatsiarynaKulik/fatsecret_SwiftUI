//
//  Date+Extensions.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 20.04.26.
//

import Foundation

extension Date {

    // MARK: - Форматирование даты

    func formattedTodayDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: self)
    }

    // MARK: - Свойства для работы с днями недели

    var weekdayIndex: Int {
        let calendar = Calendar.current

        // Получаем номер дня недели из даты. В Swift: воскресенье = 1, понедельник = 2, вторник = 3, ..., суббота = 7
        let weekday = calendar.component(.weekday, from: self)

        // Преобразуем в наш формат (0 = понедельник, 6 = воскресенье)
        if weekday == 1 { // Если воскресенье (1)
            return 6      // Возвращаем 6 (последний день недели)
        } else {
            // Для остальных дней: понедельник (2) -> 0, вторник (3) -> 1, и т.д.
            return weekday - 2
        }
    }

    // MARK: - Проверки статуса даты

    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }

    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }

    // MARK: - Сравнение дат

    func isPast(relativeTo date: Date = Date()) -> Bool {
        return self < date && !Calendar.current.isDate(self, inSameDayAs: date)
    }

        func isFuture(relativeTo date: Date = Date()) -> Bool {
            return self > date && !Calendar.current.isDate(self, inSameDayAs: date)
        }

        // MARK: - Получение компонентов даты

        var dayOfMonth: Int {
            Calendar.current.component(.day, from: self)
        }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

        // MARK: - Работа с неделями

        func datesOfCurrentWeek() -> [Date] {
            let calendar = Calendar.current

            guard let monday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else {
                return []
            }
            return (0...6).compactMap { day in
                return calendar.date(byAdding: .day, value: day, to: monday)
            }
        }
    }
