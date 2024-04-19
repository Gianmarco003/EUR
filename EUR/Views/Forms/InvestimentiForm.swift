//
//  InvestimentiForm.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 19/04/24.
//

import SwiftUI

struct InvestimentiForm: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var InvestimentoType = true
    @Binding var isPresentForm: Bool
    @State var newInvestimento: Investimento = Investimento(description: "", valore: 0, date: Date())
    @State var strValore = ""
    
    var body: some View {
        NavigationView() {
            VStack {
                if InvestimentoType {
                    NewSnapshotForm(newInvestimento: $newInvestimento, strValore: $strValore)
                } else {
                    NewInvestimentoForm(newInvestimento: $newInvestimento, strValore: $strValore)
                }
            }
            .toolbar() {
                ToolbarItem{
                    Button {
                        let strValoreFormatted = strValore.replacingOccurrences(of: ",", with: ".")
                        newInvestimento.valore = Double(strValoreFormatted) ?? 0
                        if newInvestimento.description.isEmpty {
                            newInvestimento.description = AppStorage.getNomiInvestimenti().first ?? "Error"
                        }
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
                ToolbarItem(placement: .principal) {
                    Picker("Nuovo movimento", selection: $InvestimentoType) {
                        Text("Snapshot").tag(true)
                        Text("Nuovo").tag(false)
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

#Preview {
    InvestimentiForm(isPresentForm: .constant(true))
}
