//
//  CategoriesView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 13/04/24.
//

import SwiftUI
import Charts

struct CategoriesView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var year: Int
    
    var body: some View {
        List {
            Section {
                Chart(AppStorage.chartCategories(year: year), id: \.name) { categoria in
                    SectorMark(angle: .value("categoria", categoria.value),
                               angularInset: 1.5)
                    .cornerRadius(2)
                    .foregroundStyle(by: .value("Categoria", categoria.name))
                }
                .chartLegend(.hidden)
                .frame(height: 200)
            }
            Section ("Tutte le categorie") {
                ForEach (AppStorage.getFullCategories(year: year), id: \.self) { category in
                    HStack {
                        Text(category.name)
                        Spacer()
                        Text("\(category.value, specifier: "%.2f")%")
                            .font(.title3)
                    }
                }
            }
        }
        .navigationTitle("Categorie")
    }
}

#Preview {
    CategoriesView(year: 2024)
}
