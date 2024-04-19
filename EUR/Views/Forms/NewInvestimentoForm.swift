//
//  NewInvestimentoForm.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 19/04/24.
//

import SwiftUI

struct NewInvestimentoForm: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @Binding var newInvestimento: Investimento
    @Binding var strValore: String
    
    var body: some View {
        Form {
            Section {
                TextField("Investimento", text: $newInvestimento.description)
                TextField("Valore", text: $strValore)
                    .keyboardType(.decimalPad)
                DatePicker("Data", selection: $newInvestimento.date, displayedComponents: .date)
            }
        }
        .navigationTitle("Snapshot")
    }
}

#Preview {
    NewInvestimentoForm(newInvestimento: .constant(Investimento(description: "Alleanza", valore: 999, date: Date())), strValore: .constant("999"))
}
