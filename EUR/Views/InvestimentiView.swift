//
//  InvestimentiView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 18/04/24.
//

import SwiftUI

struct InvestimentiView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var isPresentForm: Bool = false
    
    
    var body: some View {
        @State var investimenti = AppStorage.getInvestimenti()
        NavigationStack {
            List {
                ForEach(AppStorage.getNomiInvestimenti(), id: \.self) { nomeInvestimento in
                    NavigationLink(destination: DetailedInvestimentoView(snapshots: AppStorage.getSnapshots(NomeInvestimento: nomeInvestimento))) {
                        CompactInvestimentoView(nomeInvestimento: nomeInvestimento)
                    }
                }
                .onDelete(perform: AppStorage.deleteInvestimento)
            }
            .sheet(isPresented: $isPresentForm) {
                InvestimentiForm(isPresentForm: $isPresentForm)
            }
            .toolbar() {
                ToolbarItem {
                    Button {
                        isPresentForm.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .navigationTitle("Investimenti")
        }
    }
}

#Preview {
    InvestimentiView()
}
