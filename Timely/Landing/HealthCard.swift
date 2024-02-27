//
//  HealthCard.swift
//  Timely
//
//  Created by user2 on 27/02/24.
//

import SwiftUI

struct HealthCard: View {
    var currentHealth: Double
    var maxHealth: Double
    var level: Int

    var body: some View {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.grey2)
                    .frame(height: 27)
                    .cornerRadius(100)

                Rectangle()
                    .foregroundColor(.primarypink)
                    .frame(width: 200, height: 27)
                    .cornerRadius(100)

                HStack {
                    Text("\(Int(currentHealth))/1000 hp")
                        .foregroundColor(.black)
                        .padding(.leading, 12)
                        .padding(.trailing, 4)
                    Spacer()
                }
                .font(.caption)
                .bold()
            }
        }
    }

#Preview {
    HealthCard(currentHealth: 541, maxHealth: 1000, level: 13)
}
