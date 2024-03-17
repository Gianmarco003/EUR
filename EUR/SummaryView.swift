//
//  SummaryView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct SummaryView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var isPresentedForm: Bool = false
    @State var isPresentedChangeYear: Bool = false
    @State var selectedYear = Date().get(.year)
    //@State var monthLimit = selectedYear == Date().get(.year) ? Date().get(.month):12
    
    var body: some View {
        NavigationStack(){
            List(1...12,
                 id: \.self) {month in
                NavigationLink{
                    List {
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
                HStack {
                    Text(getMonthName(Month: month))
                    Spacer()
                    Text("- \(AppStorage.getTotalExpensesByMonth(Month: month, Year: selectedYear), specifier: "%.2f")€")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                }
            }
            }
            .navigationTitle(String(selectedYear))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("Add expense")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedChangeYear.toggle()
                    } label: {
                        Text("Change year")
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentedForm) {
            NewExpenseFormView(isPresentedForm: $isPresentedForm)
        }
        .sheet(isPresented: $isPresentedChangeYear) {
            ChangeYearView(isPresentedChangeYear: $isPresentedChangeYear, selectedYear: $selectedYear)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(selectedYear: 2024)
    }
}

