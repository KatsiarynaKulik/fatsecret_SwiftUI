//
//  NutrientStat.swift
//  fatsecret_SwiftUI
//
//  Created by Екатерина  on 6.05.26.
//

import SwiftUI

struct NutrientStat: View {
    let title: String
    let value: Double
    var isHighlighted: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: isHighlighted ? 14 : 16, weight: .medium))
                .foregroundColor(.gray.opacity(0.6))

            Text("\(value)")
                .font(.system(size: isHighlighted ? 16 : 14, weight: .medium))
                .foregroundColor(.gray.opacity(isHighlighted ? 0.9 : 0.6))
        }
    }
}
