//
//  NewInvestimentoForm.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 18/04/24.
//

import SwiftUI

struct NewSnapshotForm: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var newInvestimento: Investimento = Investimento(description: "", valore: 0, date: Date())
    @Binding var isPresentForm: Bool
    @State var strValore = ""
    
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
        .toolbar() {
            ToolbarItem{
                Button {
                    newInvestimento.valore = Double(strValore) ?? 0
                    AppStorage.addInvestimento(newInvestimento)
                    isPresentForm.toggle()
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            ToolbarItem (placement: .topBarLeading){
                Button {
                    isPresentForm.toggle()
                } label: {
                    Text("Annulla")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    NewSnapshotForm(isPresentForm: .constant(true))
}
