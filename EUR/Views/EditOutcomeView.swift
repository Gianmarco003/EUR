//
//  EditOutcomeView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 02/04/24.
//

import SwiftUI

struct EditOutcomeView: View {
    
    @Binding var isPresentEditForm: Bool
    @Binding var oldExpense: Expense
    @State var strOutcome = ""
    @StateObject var AppStorage = PermanentStorage()
    @State var newExpense: Expense = Expense(description: "", price: 0, date: Date(), category: "None")
    
    var body: some View {
        NavigationStack {
            OutcomeForm(newExpense: $newExpense, strPrice: $strOutcome)
                .toolbar() {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            let strPriceFormatted = strOutcome.replacingOccurrences(of: ",", with: ".")
                            newExpense.price = Double(strPriceFormatted)!
                            AppStorage.editOutcome(oldOutcome: oldExpense, newOutcome: newExpense)
                            isPresentEditForm.toggle()
                        } label: {
                            Text("Save")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            isPresentEditForm.toggle()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
                .onAppear(perform: {
                    newExpense = oldExpense
                    strOutcome = String(oldExpense.price)
                })
        }
    }
}

#Preview {
    EditOutcomeView(isPresentEditForm: .constant(true), oldExpense: .constant(MockData.sampleExpense))
}
