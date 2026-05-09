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
        if isSelectedDate(date) {
            return Color.white  // Выбранная дата - белый фон
        } else if date.isPast() {
            return Color.green.opacity(0.2)  // Пройденные дни
        } else if date.isToday {
            return Color.white  // Сегодня (но не выбрано)
        } else {
            return Color.gray.opacity(0.3)  // Будущие дни
        }
    }

    @ViewBuilder
    func circleContent(for date: Date) -> some View {
        if date.isPast() && !isSelectedDate(date) {
            // Прошедшая дата (не выбранная) - галочка
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.green)
        } else if isSelectedDate(date) {
            // Выбранная дата - ничего не отображаем (пусто)
            Text("")
        } else if date.isToday && !isSelectedDate(date) {
            // Сегодняшняя дата (не выбранная) - ничего не отображаем
            Text("")
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
