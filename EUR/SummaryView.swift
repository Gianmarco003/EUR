//
//  SummaryView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct SummaryView: View {
    
    @StateObject var AppStorage = ExpensesAppStorage()
    @State var isPresentedForm: Bool = false
    @State var isPresentedChangeYear: Bool = false
    @State var selectedYear: Int
    
    var body: some View {
        NavigationStack(){
            List(1...Date().get(.month), id: \.self) {month in
                NavigationLink{
                    List {
                        ForEach(AppStorage.getExpensesByMonth(
                            Month: month,
                            Year: selectedYear))
                        { expense in
                            CompactExpenseView(expense: expense)
                        }
                        .onDelete (perform: AppStorage.deleteItems)
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
                        .font(.title2)
                    Spacer()
                    Text("- \(AppStorage.getTotalExpensesByMonth(Month: month, Year: selectedYear), specifier: "%.2f")€")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                }
            }
            }
            .navigationTitle("\(selectedYear)")
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
        .onAppear {
            selectedYear = Date().get(.year)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(selectedYear: 2024)
    }
}

