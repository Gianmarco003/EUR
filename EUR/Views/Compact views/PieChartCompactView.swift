//
//  PieChartCompactView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 13/04/24.
//

import SwiftUI
import Charts

struct PieChartCompactView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var year: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Top 3")
                    .font(.title)
                    .fontWeight(.semibold)
                ForEach(AppStorage.chartTopCategories(year: year), id: \.name) { category in
                    Text(category.fullname)
                }
                Spacer()
            }
            Spacer()
            Chart(AppStorage.chartCategories(year: year), id: \.name) { categoria in
                SectorMark(angle: .value("categoria", categoria.value),
                           angularInset: 1.5)
                .cornerRadius(2)
                .foregroundStyle(by: .value("Categoria", categoria.name))
            }
            .chartLegend(.hidden)
            .frame(width: 100)
            .scaledToFill()
        }
        .frame(height: 100)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    PieChartCompactView(year: 2024)
}
