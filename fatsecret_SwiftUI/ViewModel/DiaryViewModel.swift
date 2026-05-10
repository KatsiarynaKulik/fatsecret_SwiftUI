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
    // TODO: Данные для карточек (заглушки). Потом добавлю реальные данные
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
    @Published var currentDate = Date()

    var weekDates: [Date] {
        currentDate.datesOfCurrentWeek()  // Динамическое обновление недели
    }

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
        if isSelectedDate(date) && date.isToday {
            // Выбранная сегодняшняя дата - зеленый фон
            return Color.green
        } else if isSelectedDate(date) {
            // Выбранная дата (не сегодня) 
            return Color.gray.opacity(0.2)
        } else if date.isPast() {
            // Пройденные дни (не выбранные)
            return Color.gray.opacity(0.2)
        } else if date.isToday {
            // Сегодня (не выбрано)
            return Color.gray
        } else {
            // Будущие дни
            return Color.gray.opacity(0.3)
        }
    }

    @ViewBuilder
    func circleContent(for date: Date) -> some View {
        if date.isPast() && !isSelectedDate(date) {
            // Прошедшая дата (не выбранная) - зеленая галочка
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.green)
        } else if isSelectedDate(date) && date.isToday {
            // Выбранная сегодняшняя дата - белая галочка
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        } else if isSelectedDate(date) {
            // Выбранная дата (не сегодня)
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.green)
        } else if date.isToday && !isSelectedDate(date) {
            // Сегодняшняя дата (не выбранная)
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        } else {
            // Будущая дата - ничего не отображаем
            Text("")
        }
    }

    func isSelectedDate(_ date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: currentDate)
    }

    func openCalendar() {
        isCalendarPresented = true
    }

    func closeCalendar() {
        isCalendarPresented = false
    }

    func updateCurrentDate(_ date: Date) {
        currentDate = date
        //loadDataForDate(date)
        print("Обновляю календарь с датой \(date.formattedTodayDate())")
    }

    func loadDataForDate(_ date: Date) {
        // TODO: Здесь загрузка данных из базы или API
        print("Загрузка данных для: \(date.formattedTodayDate())")
    }
}
