//
//  MonthListView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 29/03/24.
//

import SwiftUI
import Charts

struct MonthListView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var year: Int
    var month: Int
    @State var isPresentedForm: Bool = false
    
    var body: some View {
        List {
            if !AppStorage.getIncomesByMonth (
                Month: month,
                Year: year).isEmpty {
                Section("Entrate") {
                    ForEach(AppStorage.getIncomesByMonth(
                        Month: month,
                        Year: year))
                    { income in
                        NavigationLink {
                            DetailIncomeView(income: income)
                        } label: {
                            CompactIncomeView(income: income)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            AppStorage.deleteIncomeOnDelete(index: index, year: year, month: month)
                        }
                    })
                }
            }
            if !AppStorage.getExpensesByMonth (
                Month: month,
                Year: year).isEmpty {
                Section("Uscite") {
                    ForEach(AppStorage.getExpensesByMonth(
                        Month: month,
                        Year: year))
                    { expense in
                        NavigationLink {
                            DetailExpenseView(expense: .constant(expense))
                        } label: {
                            CompactExpenseView(expense: expense)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            AppStorage.deleteExpenseOnDelete(index: index, year: year, month: month)
                        }
                    })
                }
            }
        }
        .navigationTitle(String(getMonthName(Month: month)))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresentedForm.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        .sheet(isPresented: $isPresentedForm) {
            NewMovementFormView(isPresentedForm: $isPresentedForm)
        }
    }
}

#Preview {
    MonthListView(year: 2024, month: 3)
}
