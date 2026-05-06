//
//  MealData.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 6.05.26.
//

import Foundation

// MARK: - Модель данных для приема пищи

struct MealData {
    let type: MealType
    let proteins: Double
    let fats: Double
    let carbs: Double
    let calories: Double
}
