//
//  SummaryCompactView.swift
//  EUR
//
//  Created by Gianmarco on 23/03/24.
//

import SwiftUI

struct MonthSummaryCompactView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var month: Int
    var year: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(getMonthName(Month: month))
                    .font(.title)
                    .fontWeight(.semibold)
                Text("+\(AppStorage.getTotalIncomesByMonth(Month: month, Year: year), specifier: "%.2f")")
                Text("\(AppStorage.getTotalExpensesByMonth(Month: month, Year: year), specifier: "%.2f")")
            }
            Spacer()
            VStack (alignment: .trailing)
            {
                Text("\(AppStorage.getTotalByMonth(Month: month, Year: year), specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(AppStorage.getTotalByMonth(Month: month, Year: year).isLess(than: 0) ? .red : .accent)
                Text("\(AppStorage.deltaByMonth(month: month, year: year), specifier: "%.0f")%")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(AppStorage.getTotalByMonth(Month: month, Year: year).isLess(than: 0) ? .red : .accent)
            }
        }
    }
}

struct SummaryCompactView_Previews: PreviewProvider {
    static var previews: some View {
        MonthSummaryCompactView(month: Date().get(.month), year: Date().get(.year))
    }
}
