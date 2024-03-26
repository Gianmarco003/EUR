//
//  NewIncomeFormView.swift
//  EUR
//
//  Created by Gianmarco on 21/03/24.
//

import SwiftUI

struct IncomeForm: View {
    
    @Binding var newIncome: Income
    @Binding var strIncome: String
    @StateObject var AppStorage = PermanentStorage()
    
    var body: some View {
        Form {
            Section {
                TextField("Description", text: $newIncome.description)
                TextField("Import", text: $strIncome)
                    .keyboardType(.decimalPad)
                DatePicker("Date", selection: $newIncome.date, displayedComponents: .date)
            }
        }
        .navigationTitle("New income")
    }
}

struct NewIncomeFormView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeForm(newIncome: .constant(MockData.sampleIncome), strIncome: .constant(""))
    }
}
