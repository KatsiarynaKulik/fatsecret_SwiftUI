//
//  MealCardView.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 2.05.26.
//

import SwiftUI

// MARK: - Карточка приема пищи

struct MealCard: View {
    let meal: MealData
    let onAddButtonTapped: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Верхняя часть: название и кнопка плюс
            HStack {
                // Левая часть - название приема пищи
                HStack(spacing: 8) {
                    // Иконка для визуального разнообразия
                    Image(systemName: meal.type.icon)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.orange)

                    Text(meal.type.rawValue)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                }

                Spacer()

                // Правая часть - кнопка добавления
                Button(action: onAddButtonTapped) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.orange)
                }
            }

            // Разделительная линия
            Divider()
                .background(Color.gray.opacity(0.2))

            // Нижняя часть: нутриенты
            HStack(spacing: 20) {
                NutrientBadge(name: "Белки", value: meal.proteins, color: .blue)
                NutrientBadge(name: "Жиры", value: meal.fats, color: .green)
                NutrientBadge(name: "Углеводы", value: meal.carbs, color: .orange)

                Spacer()

                // Калории
                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(meal.calories)")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.orange)
                    Text("ккал")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(16) // Внутренние отступы
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(
                    color: Color.black.opacity(0.1),
                    radius: 8,
                    x: 0,
                    y: 2
                )
        )
    }
}

// MARK: - Preview для дизайнера
#Preview {
    VStack(spacing: 20) {
        MealCard(
            meal: MealData(
                type: .breakfast,
                proteins: 15.2,
                fats: 8.5,
                carbs: 25.0,
                calories: 245
            )
        ) {
            print("Add button tapped")
        }

        MealCard(
            meal: MealData(
                type: .lunch,
                proteins: 28.4,
                fats: 15.2,
                carbs: 45.8,
                calories: 520
            )
        ) {
            print("Add button tapped")
        }

        MealCard(
            meal: MealData(
                type: .dinner,
                proteins: 22.1,
                fats: 12.0,
                carbs: 35.5,
                calories: 380
            )
        ) {
            print("Add button tapped")
        }
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
