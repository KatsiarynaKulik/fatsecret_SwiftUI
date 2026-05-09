//
//  DiaryView.swift
//  fatsecret_SwiftUI
//
//  Created by Kate Kulik  on 6.05.26.
//

import SwiftUI

struct DiaryView: View {
    @StateObject private var viewModel = DiaryViewModel()

    var body: some View {
        VStack(spacing: 8) {
            // Кнопка календаря
            Button(action: {
                viewModel.openCalendar()
            }) {
                Image(systemName: "calendar")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                    .frame(width: 44, height: 44)
                    .background(Color.gray.opacity(0.6))
                    .clipShape(.circle)
            }

            // Дата
            Text(viewModel.currentDate.formattedTodayDate())
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.black)

            // Календарь недели
            HStack(spacing: 12) {
                ForEach(Array(viewModel.weekDates.enumerated()), id: \.offset) { index, date in
                    VStack(spacing: 4) {
                        Circle()
                            .fill(viewModel.circleColor(for: date))
                            .frame(width: 40, height: 40)
                            .overlay(viewModel.circleContent(for: date))
                            .overlay(
                                Circle()
                                    .stroke(viewModel.isSelectedDate(date) ? Color.green : Color.clear, lineWidth: 2)
                            )

                        Text(viewModel.weekDays[index])
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(date.isPast() ? .gray.opacity(0.6) : .black)
                    }
                }
            }

            // Статистика нутриентов
            HStack(spacing: 24) {
                NutrientStat(title: "Белки", value: viewModel.totalProteins)
                NutrientStat(title: "Жиры", value: viewModel.totalFats)
                NutrientStat(title: "Углеводы", value: viewModel.totalCarbs)
                NutrientStat(title: "Калории", value: viewModel.totalCalories, isHighlighted: true)
            }

            // Карточки приемов пищи
            MealCard(meal: viewModel.breakfast) {
                print("Добавить в завтрак")
            }

            MealCard(meal: viewModel.lunch) {
                print("Добавить в обед")
            }

            MealCard(meal: viewModel.dinner) {
                print("Добавить в ужин")
            }

            MealCard(meal: viewModel.snack) {
                print("Добавить перекус")
            }
            // MARK: - Navigation To CalendarView
            .sheet(isPresented: $viewModel.isCalendarPresented) {
                CalendarView(onDateSelected: { selectedDate in
                    viewModel.updateCurrentDate(selectedDate)
                })
                    .presentationDetents([.height(500)])  // TODO: Подумать над высотой
                    .presentationBackground(.white)
                    .ignoresSafeArea()
            }
        }
    }
}
