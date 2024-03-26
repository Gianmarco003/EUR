//
//  NewIncomeFormView.swift
//  EUR
//
//  Created by Gianmarco on 21/03/24.
//

import SwiftUI

struct IncomeForm: View {
    
    @State var newIncome: Income = Income(description: "",
                                          income: 0,
                                          date: Date())
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
    }
}

struct NewIncomeFormView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeForm(strIncome: .constant(""))
    }
}
