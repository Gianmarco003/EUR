//
//  NewInvestimentoForm.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 18/04/24.
//

import SwiftUI

struct NewSnapshotForm: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @Binding var newInvestimento: Investimento
    @Binding var strValore: String
    
    var body: some View {
        Form {
            Section {
                Picker("Investimento", selection: $newInvestimento.description) {
                    ForEach(AppStorage.getNomiInvestimenti(), id: \.self) { nomi in
                        Text(nomi)
                    }
                }
                TextField("Valore", text: $strValore)
                    .keyboardType(.decimalPad)
                DatePicker("Data", selection: $newInvestimento.date, displayedComponents: .date)
            }
        }
        .navigationTitle("Snapshot")
    }
}

#Preview {
    NewSnapshotForm(newInvestimento: .constant(Investimento(description: "Alleanza", valore: 999, date: Date())), strValore: .constant("999"))
}
