//
//  ChartsView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 28/03/24.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @Binding var year: Int
    
    var body: some View {
        Section("Incomes vs outcomes") {
            VStack {
                VStack{
                    Text("Incomes")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Chart {
                        ForEach(AppStorage.chartBarMarkIncomesByMonth(year: year)) { month in
                            BarMark(
                                x: .value("Month", month.x, unit: .month),
                                y: .value("Value", month.y)
                            )
                            .foregroundStyle(Color(.accent))
                        }
                    }
                    .frame(height: 100)
                    .padding()
                }
                VStack {
                    Text("Outcomes")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Chart {
                        ForEach(AppStorage.chartBarMarkExpensesByMonth(year: year)) { month in
                            BarMark(
                                x: .value("Month", month.x, unit: .month),
                                y: .value("Value", month.y)
                            )
                            .foregroundStyle(Color(.red))
                        }
                    }
                    .frame(height: 100)
                    .padding()
                }
            }
        }
        Section("Categorie") {
            Chart(AppStorage.chartCategories(year: year), id: \.name) { dataItem in
                SectorMark(angle: .value("categoria", dataItem.value),
                           angularInset: 1.5)
                .cornerRadius(2)
                .foregroundStyle(by: .value("Categoria", dataItem.name))
            }
            .frame(height: 300)
            .padding()
            ForEach(AppStorage.getExpensesByMonth(
                Month: Date().get(.month),
                Year: Date().get(.year)))
            { expense in
                NavigationLink {
                    DetailExpenseView(expense: .constant(expense))
                } label: {
                    CompactExpenseView(expense: expense)
                }
            }
        }
        .navigationTitle("Charts")
    }
}

#Preview {
    ChartsView(year: .constant(2024))
}
