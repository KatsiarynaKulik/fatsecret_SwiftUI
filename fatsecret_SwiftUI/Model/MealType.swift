//
//  MealType.swift
//  fatsecret_SwiftUI
//
//  Created by Kate Kulik  on 6.05.26.
//

import Foundation

enum MealType: String {
        case breakfast = "Завтрак"
        case lunch = "Обед"
        case dinner = "Ужин"
        case snack = "Перекус"

    var icon: String {
        switch self {
        case .breakfast: return "sunrise.fill"
        case .lunch: return "sun.max.fill"
        case .dinner: return "moon.fill"
        case .snack: return "applelogo"
        }
    }
}
