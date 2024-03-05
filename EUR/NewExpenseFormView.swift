//
//  NewExpenseFormView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct NewExpenseFormView: View {
    
    @Binding var isPresentedForm: Bool
    @Binding var Expenses: [Expense]
    @State var newExpense: Expense = Expense(description: "",
                                             amount: 0,
                                             date: Date(),
                                             category: "")
    @State var strAmount = ""
    
    var body: some View {
        NavigationStack() {
            Form {
                Section {
                    TextField("Description", text: $newExpense.description)
                    Picker("Category", selection: $newExpense.category) {
                        Text("Food").tag("Food")
                        Text("Gas").tag("Gas")
                        Text("Clothes").tag("Clothes")
                    }
                    TextField("Amount", text: $strAmount)
                        .keyboardType(.decimalPad)
                    DatePicker( "Date", selection: $newExpense.date, displayedComponents: .date)
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
                        newExpense.amount = Double(strAmount)!
                        Expenses.append(newExpense)
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

//struct NewExpenseFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewExpenseFormView(isPresentedForm: .constant(true), Expenses: MockData.sampleExpenses)
//    }
//}
