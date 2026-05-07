//
//  CalendarView.swift
//  fatsecret_SwiftUI
//
//  Created by Kate Kulik  on 7.05.26.
//

import SwiftUI

struct CalendarView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedDate = Date()

    var body: some View {
        VStack(spacing: 0) {
            // Header с кнопкой закрытия
            HStack {
                Text("Выберите дату")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)

                Spacer()

                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.gray.opacity(0.6))
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 16)

            // Календарь
            DatePicker(
                "Выберите дату",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding(.horizontal, 16)
            .tint(.green)

            // Кнопка выбора
            Button(action: {
                print("Выбрана дата: \(selectedDate)")
                dismiss()
            }) {
                Text("Выбрать")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 24)
        }
        .background(Color.white)
    }
}
