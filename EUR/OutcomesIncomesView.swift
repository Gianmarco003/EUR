//
//  OutcomesIncomesView.swift
//  EUR
//
//  Created by Gianmarco on 22/03/24.
//

import SwiftUI

struct OutcomesIncomesView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var isPresentedForm: Bool = false
    @State var isPresentedChangeYear: Bool = false
    @State var selectedYear = Date().get(.year)
    
    var body: some View {
        NavigationStack() {
            List(1...12, id: \.self) {month in
                NavigationLink{
                    List {
                        if !AppStorage.getIncomesByMonth (
                            Month: month,
                            Year: selectedYear).isEmpty {
                            Section("Incomes") {
                                ForEach(AppStorage.getIncomesByMonth(
                                    Month: month,
                                    Year: selectedYear))
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
                            Year: selectedYear).isEmpty {
                            Section("Expenses") {
                                ForEach(AppStorage.getExpensesByMonth(
                                    Month: month,
                                    Year: selectedYear))
                                { expense in
                                    NavigationLink {
                                        DetailExpenseView(expense: expense)
                                    } label: {
                                        CompactExpenseView(expense: expense)
                                    }
                                }
                                .onDelete (perform: AppStorage.deleteExpense)
                            }
                        }
                    }
                    .navigationTitle(getMonthName(Month: month))
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresentedForm.toggle()
                            } label: {
                                Text("Add expense")
                            }
                        }
                    }
                }
            label: {
                SummaryCompactView(month: month, year: selectedYear)
            }
            }
            .navigationTitle("2024")
            .toolbar {
                //                ToolbarItem (placement: .principal) {
                //                    Picker("Year", selection: $selectedYear) {
                //                        Text("2024").tag(2024)
                //                        Text("2023").tag(2023)
                //                        Text("2022").tag(2022)
                //                    }
                //                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("Add movement")
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentedForm) {
            NewMovementFormView(isPresentedForm: $isPresentedForm)
        }
        .sheet(isPresented: $isPresentedChangeYear) {
            ChangeYearView(isPresentedChangeYear: $isPresentedChangeYear, selectedYear: $selectedYear)
        }    }
}

struct OutcomesIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomesIncomesView()
    }
}
