//
//  OutcomeForm.swift
//  EUR
//
//  Created by Gianmarco on 23/03/24.
//

import SwiftUI

struct OutcomeForm: View {
    
    @State var newExpense: Expense = Expense(description: "",
                                             price: 0,
                                             date: Date(),
                                             category: "None")
    @Binding var strPrice: String
    @StateObject var AppStorage = PermanentStorage()
    
    var body: some View {
            Form {
                Section {
                    TextField("Description", text: $newExpense.description)
                    Picker("Category", selection: $newExpense.category) {
                        ForEach(AppStorage.getCategories(), id: \.self) { category in
                            Text(category)
                        }
                    }
                    TextField("Amount", text: $strPrice)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $newExpense.date, displayedComponents: .date)
                }
            }
        
    }
}

struct OutcomeForm_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeForm(strPrice: .constant(""))
    }
}
