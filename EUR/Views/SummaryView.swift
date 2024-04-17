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
    @State var isPresentedChangeYearForm: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: OutcomesIncomesView(year: year)) {
                        YearSummaryCompactView(year: year)
                    }
                    if year == Date().get(.year) {
                        NavigationLink(destination: MonthListView(year: year, month: Date().get(.month))) {
                            MonthSummaryCompactView(month: Date().get(.month), year: Date().get(.year))
                        }
                    }
                }
                Section("Categorie") {
                    NavigationLink(destination: CategoriesView(year: year)) {
                        PieChartCompactView(year: year)
                    }
                }
                Section("Evntrate vs Uscite") {
                    VStack {
                        VStack{
                            Text("Entrate")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Chart {
                                ForEach(AppStorage.chartBarMarkIncomesByMonth(year: year)) { month in
                                    BarMark(
                                        x: .value("Mese", month.x, unit: .month),
                                        y: .value("Entrate", month.y)
                                    )
                                    .foregroundStyle(Color(.accent))
                                }
                            }
                            .frame(height: 100)
                            .padding()
                        }
                        VStack {
                            Text("Uscite")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Chart {
                                ForEach(AppStorage.chartBarMarkExpensesByMonth(year: year)) { month in
                                    BarMark(
                                        x: .value("Mese", month.x, unit: .month),
                                        y: .value("Uscite", month.y)
                                    )
                                    .foregroundStyle(Color(.red))
                                }
                            }
                            .frame(height: 100)
                            .padding()
                        }
                    }
                }
            }
            .sheet(isPresented: $isPresentedForm) {
                NewMovementFormView(isPresentedForm: $isPresentedForm)
            }
            .sheet(isPresented: $isPresentedChangeYearForm) {
                ChangeYearView(isPresentedChangeYear: $isPresentedChangeYearForm, year: $year)
            }
            .navigationTitle("Riepilogo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedChangeYearForm.toggle()
                    } label: {
                        Text(String(year))
                    }
                }
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(year: 2024)
    }
}

