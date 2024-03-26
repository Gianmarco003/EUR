//
//  SummaryCompactView.swift
//  EUR
//
//  Created by Gianmarco on 23/03/24.
//

import SwiftUI

struct SummaryCompactView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var month: Int
    var year: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(getMonthName(Month: month))
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(AppStorage.getTotalByMonth(Month: month, Year: year).isLess(than: 0) ? .red : .green)
                Text("In: +\(AppStorage.getTotalIncomesByMonth(Month: month, Year: year), specifier: "%.2f")")
                Text("Out: \(AppStorage.getTotalExpensesByMonth(Month: month, Year: year), specifier: "%.2f")")
            }
            Spacer()
            VStack {
                Text("\(AppStorage.getTotalByMonth(Month: month, Year: year), specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(AppStorage.getTotalByMonth(Month: month, Year: year).isLess(than: 0) ? .red : .green)
            }
        }
    }
}

struct SummaryCompactView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCompactView(month: Date().get(.month), year: Date().get(.year))
    }
}
