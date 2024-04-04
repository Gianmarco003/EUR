//
//  OutcomesIncomesView.swift
//  EUR
//
//  Created by Gianmarco on 22/03/24.
//

import SwiftUI
import Charts

struct OutcomesIncomesView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var isPresentedForm: Bool = false
    var year: Int
    @State var monthLimit = 12
    @State var isPresentedChangeYear: Bool = false
    
    var body: some View {
        NavigationStack() {
            List(1...monthLimit, id: \.self) {month in
                    NavigationLink{
                        MonthListView(year: year, month: month)
                        .navigationTitle(getMonthName(Month: month))
                    }
                label: {
                    MonthSummaryCompactView(month: month, year: year)
                }
            }
            .navigationTitle(String(year))
            .toolbar {
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
//        .sheet(isPresented: $isPresentedChangeYear) {
//            ChangeYearView(isPresentedChangeYear: $isPresentedChangeYear, selectedYear: selectedYear)
//        }
        .onAppear(perform: {
            if year == Date().get(.year) {
                monthLimit = Date().get(.month)
            }
        })
    }
}

struct OutcomesIncomesView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomesIncomesView(year: 2024)
    }
}
