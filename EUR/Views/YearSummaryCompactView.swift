//
//  YearSummaryCompactView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 28/03/24.
//

import SwiftUI

struct YearSummaryCompactView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var year: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(String(year))
                    .font(.title)
                    .fontWeight(.semibold)
                Text("+\(AppStorage.getTotalIncomesByYear(Year: year), specifier: "%.2f")")
                Text("\(AppStorage.getTotalExpensesByYear(Year: year), specifier: "%.2f")")
            }
            Spacer()
            VStack (alignment: .trailing)
            {
                Text("\(AppStorage.getTotalByYear(Year: year), specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(AppStorage.getTotalByYear(Year: year).isLess(than: 0) ? .red : .accent)
                Text("\(AppStorage.deltaByYear(year: year), specifier: "%.0f")%")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(!AppStorage.getTotalExpensesByYear(Year: year).isLess(than: 0) ? .red : .accent)
            }
        }
    }
}

#Preview {
    YearSummaryCompactView(year: 2024)
}
