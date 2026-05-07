//
//  DiaryViewModel.swift
//  fatsecret_SwiftUI
//
//  Created by Kate Kulik  on 18.04.26.
//

import Foundation
import Combine
import SwiftUI

class DiaryViewModel: ObservableObject {
    // Данные для карточек (заглушки). Потом добавлю реальные данные
    @Published var breakfast = MealData(
        type: .breakfast,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
    )

    @Published var lunch = MealData(
        type: .lunch,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
    )

    @Published var dinner = MealData(
        type: .dinner,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
    )

    @Published var snack = MealData(
        type: .snack,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
    )

    @Published var isCalendarPresented = false

    let weekDates = Date().datesOfCurrentWeek()
    let weekDays = ["пн", "вт", "ср", "чт", "пт", "сб", "вс"]

    var totalProteins: Double {
        breakfast.proteins + lunch.proteins + dinner.proteins + snack.proteins
    }

    var totalFats: Double {
        breakfast.fats + lunch.fats + dinner.fats + snack.fats
    }

    var totalCarbs: Double {
        breakfast.carbs + lunch.carbs + dinner.carbs + snack.carbs
    }

    var totalCalories: Double {
        breakfast.calories + lunch.calories + dinner.calories + snack.calories
    }

    func circleColor(for date: Date) -> Color {
        if date.isPast() {
            return Color.green.opacity(0.2)
        } else if date.isToday {
            return Color.white
        } else {
            return Color.gray.opacity(0.3)
        }
    }

    @ViewBuilder
    func circleContent(for date: Date) -> some View {
        if date.isPast() {
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.green)
        } else if date.isToday {
            Text("\(date.dayOfMonth)")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        } else {
            Text("")
        }
    }

    func openCalendar() {
        isCalendarPresented = true
    }

    func closeCalendar() {
        isCalendarPresented = false
    }
}
