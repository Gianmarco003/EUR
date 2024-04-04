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
                Section("Incomes") {
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
                    .onDelete (perform: AppStorage.deleteIncome)
                }
            }
            if !AppStorage.getExpensesByMonth (
                Month: month,
                Year: year).isEmpty {
                Section("Expenses") {
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
                    .onDelete (perform: AppStorage.deleteExpense)
                }
            }
        }
        .navigationTitle(String(getMonthName(Month: month)))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresentedForm.toggle()
                } label: {
                    Text("Add movement")
                }
            }
        }
        .sheet(isPresented: $isPresentedForm) {
            NewMovementFormView(isPresentedForm: $isPresentedForm)
        }
    }
}

#Preview {
    MonthListView(year: 2024, month: 1)
}
