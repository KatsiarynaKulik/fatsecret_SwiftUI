//
//  CalendarView.swift
//  fatsecret_SwiftUI
//
//  Created by Kate Kulik  on 7.05.26.
//

import SwiftUI
// TODO: убрать возможность вызова барабана
struct CalendarView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedDate = Date()

    let onDateSelected: (Date) -> Void

    var body: some View {
        VStack(spacing: 0) {

            DatePicker(
                "Выберите дату",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding(.horizontal, 16)
            .tint(.green)

            Button(action: {
                print("Выбрана дата: \(selectedDate)")
                onDateSelected(selectedDate)
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
