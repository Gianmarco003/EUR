//
//  DetailedInvestimentoView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 18/04/24.
//

import SwiftUI
import Charts

struct DetailedInvestimentoView: View {
    
    @State var snapshots: [Investimento]
    @State var isPresentForm: Bool = false
    
    var body: some View {
        List {
            Section {
                VStack{
                    VStack{
                        Text("1 mese")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Chart(snapshots, id: \.self) { snapshot in
                            LineMark(x: .value("Data", snapshot.date, unit: .month), y: .value("Valore", snapshot.valore))
                                .symbol(.circle)
                        }
                        .frame(height: 150)
                        .padding()
                    }
                    VStack{
                        Text("1 anno")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Chart(snapshots, id: \.self) { snapshot in
                            LineMark(x: .value("Data", snapshot.date, unit: .year), y: .value("Valore", snapshot.valore))
                                .symbol(.circle)
                        }
                        .frame(height: 150)
                        .padding()
                    }
                    VStack{
                        Text("2 anni")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Chart(snapshots, id: \.self) { snapshot in
                            LineMark(x: .value("Data", snapshot.date, unit: .year), y: .value("Valore", snapshot.valore))
                                .symbol(.circle)
                        }
                        .frame(height: 150)
                        .padding()
                    }
                }
            }
            Section {
                NavigationLink {
                    List (snapshots, id: \.self){ investimento in
                        HStack {
                            Text(investimento.date.formatted(date: .abbreviated, time: .omitted))
                            Spacer()
                            Text(String(investimento.valore))
                        }
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
                    .navigationTitle(snapshots.first?.description ?? "Placeholder")
                } label: {
                    Text("Dettagli")
                }
            }
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
        .navigationTitle(snapshots.first?.description ?? "Placeholder")
    }
}

#Preview {
    DetailedInvestimentoView(snapshots: [Investimento(description: "Alleanza", valore: 255, date: Date())])
}
