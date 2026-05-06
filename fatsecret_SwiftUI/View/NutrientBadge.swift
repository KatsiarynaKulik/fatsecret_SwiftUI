//
//  NutrientBadge.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 6.05.26.
//

import SwiftUI

// MARK: - Компонент бейджа нутриента

struct NutrientBadge: View {
    let name: String
    let value: Double
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.gray)

            HStack(alignment: .lastTextBaseline, spacing: 2) {
                Text(String(value))
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(color)

            }
        }
    }
}
