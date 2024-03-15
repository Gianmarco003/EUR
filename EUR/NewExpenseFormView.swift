//
//  NewExpenseFormView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct NewExpenseFormView: View {
    
    @Binding var isPresentedForm: Bool
    @State var newExpense: Expense = Expense(description: "",
                                             price: 0,
                                             date: Date(),
                                             category: "None")
    @State var strPrice = ""
    @StateObject var AppStorage = ExpensesAppStorage()
    
    var body: some View {
        NavigationStack() {
            Form {
                Section {
                    TextField("Description", text: $newExpense.description)
                    Picker("Category", selection: $newExpense.category) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    TextField("Amount", text: $strPrice)
                        .keyboardType(.decimalPad)
                    DatePicker("Date", selection: $newExpense.date, displayedComponents: .date)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("Cancel")
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("New expense")
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        newExpense.price = Double(strPrice)!
                        AppStorage.add(newExpense)
                        isPresentedForm.toggle()
                    } label: {
                        Text("Add")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct NewExpenseFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewExpenseFormView(isPresentedForm: .constant(true))
    }
}
