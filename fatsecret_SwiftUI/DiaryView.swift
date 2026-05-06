//
//  DearyView.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 18.04.26.
//

import SwiftUI

struct DiaryView: View {

    // Данные для карточек
    @State private var breakfast = MealData(
        type: .breakfast,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
    )

    @State private var lunch = MealData(
        type: .lunch,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
    )

    @State private var dinner = MealData(
        type: .dinner,
        proteins: 0,
        fats: 0,
        carbs: 0,
        calories: 0
        )

        @State private var snack = MealData(
            type: .snack,
            proteins: 0,
            fats: 0,
            carbs: 0,
            calories: 0
    )

    private let weekDates = Date().datesOfCurrentWeek()
    private let weekDays = ["пн", "вт", "ср", "чт", "пт", "сб", "вс"]

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {

                Button(action: {
                    print("Действие: открывать календарь")
                }) {
                    Image(systemName: "calendar")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.6))
                        .clipShape(.circle)
                }
            }

            Text(Date().formattedTodayDate())
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)

            HStack(spacing: 12) {
                ForEach(Array(weekDates.enumerated()), id: \.offset) { index, date in
                    VStack(spacing: 4) {
                        Circle()
                            .fill(circleColor(for: date))
                            .frame(width: 40, height: 40)
                            .overlay(circleContent(for: date))
                            .overlay(
                                Circle()
                                    .stroke(date.isToday ? Color.green : Color.clear, lineWidth: 2)
                            )

                        Text(weekDays[index])
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(date.isPast() ? .gray.opacity(0.6) : .black)
                    }
                }
            }

            HStack(spacing: 24) {
                VStack(spacing: 8) {
                    Text("Белки")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray.opacity(0.6))

                    Text("\(breakfast.proteins + lunch.proteins + dinner.proteins + snack.proteins)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray.opacity(0.6))
                }

                VStack(spacing: 8) {
                    Text("Жиры")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray.opacity(0.6))

                    Text("\(breakfast.fats + lunch.fats + dinner.fats + snack.fats)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray.opacity(0.6))
                }

                VStack(spacing: 8) {
                    Text("Углеводы")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray.opacity(0.6))

                    Text("\(breakfast.carbs + lunch.carbs + dinner.carbs + snack.carbs)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray.opacity(0.6))
                }

                VStack(spacing: 8) {
                    Text("Калории")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray.opacity(0.9))

                    Text("\(breakfast.calories + lunch.calories + dinner.calories + snack.calories)")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray.opacity(0.9))
                }
            }
            // Карточки приемов пищи
            MealCard(meal: breakfast) {
                print("Добавить в завтрак")
            }

            MealCard(meal: lunch) {
                print("Добавить в обед")
            }

            MealCard(meal: dinner) {
                print("Добавить в ужин")
            }

            MealCard(meal: snack) {
                print("Добавить перекус")
            }
        }
    }

    private func circleColor(for date: Date) -> Color {
        if date.isPast() {
            return Color.green.opacity(0.2)
        } else if date.isToday {
            return Color.white
        } else {
            return Color.gray.opacity(0.3)
        }
    }

    @ViewBuilder
    private func circleContent(for date: Date) -> some View {
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
}
