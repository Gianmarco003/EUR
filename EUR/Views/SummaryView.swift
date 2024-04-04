//
//  SummaryView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI
import Charts

struct SummaryView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var year: Int
    @State var isPresentedForm: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: OutcomesIncomesView(year: year)) {
                        YearSummaryCompactView(year: year)
                    }
                    NavigationLink(destination: MonthListView(year: year, month: Date().get(.month))) {
                        MonthSummaryCompactView(month: Date().get(.month), year: Date().get(.year))
                    }
                }
                Section {
                    
                }
                ChartsView(year: $year)
            }
            .navigationTitle("Riepilogo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("Add movement")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if year == 2024 {
                            year = 2023
                        } else {
                            year = 2024
                        }
                    } label: {
                        if year == 2024 {
                            Text("2024")
                        } else {
                            Text("2023")
                        }
                    }
                }
            }
            .sheet(isPresented: $isPresentedForm) {
                NewMovementFormView(isPresentedForm: $isPresentedForm)
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(year: 2024)
    }
}

