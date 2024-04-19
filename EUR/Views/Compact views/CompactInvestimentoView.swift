//
//  CompactInvestimentoView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 18/04/24.
//

import SwiftUI

struct CompactInvestimentoView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    let nomeInvestimento: String
    
    var body: some View {
        @State var snapshots: [Investimento] = AppStorage.getSnapshots(NomeInvestimento: nomeInvestimento)
        HStack {
            VStack(alignment: .leading) {
                Text(snapshots.first?.description ?? "Placeholder")
                    .font(.body)
                .fontWeight(.semibold)
                Text(snapshots.first?.date.formatted(date: .abbreviated, time: .omitted) ?? "Placeholder")
            }
            Spacer()
            Text("€ \(snapshots.first?.valore ?? 0, specifier: "%.2f")")
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    CompactInvestimentoView(nomeInvestimento: "Bitcoin")
}
