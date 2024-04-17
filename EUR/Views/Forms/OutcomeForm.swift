//
//  OutcomeForm.swift
//  EUR
//
//  Created by Gianmarco on 23/03/24.
//

import SwiftUI

struct OutcomeForm: View {
    
    @Binding var newExpense: Expense
    @Binding var strPrice: String
    @StateObject var AppStorage = PermanentStorage()
    
    var body: some View {
        Form {
            Section {
                TextField("Descrizione", text: $newExpense.description)
                Picker("Categoria", selection: $newExpense.category) {
                    ForEach(AppStorage.getCategories(), id: \.self) { category in
                        Text(category)
                    }
                }
                TextField("Importo", text: $strPrice)
                    .keyboardType(.decimalPad)
                DatePicker("Data", selection: $newExpense.date, displayedComponents: .date)
            }
        }
        .navigationTitle("Nuova spesa")
    }
}

struct OutcomeForm_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeForm(newExpense: .constant(MockData.sampleExpense) , strPrice: .constant(""))
    }
}
