//
//  NewExpenseFormView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct NewMovementFormView: View {
    
    @Binding var isPresentedForm: Bool
    @State var NewMovementType = true
    @State var strPrice = ""
    @StateObject var AppStorage = PermanentStorage()
    @State var newIncome: Income = Income(description: "",
                                             income: 0,
                                             date: Date())
    @State var strIncome = ""
    @State var newExpense: Expense = Expense(description: "",
                                             price: 0,
                                             date: Date(),
                                             category: "None")
    
    var body: some View {
        NavigationView() {
            VStack {
                if NewMovementType {
                    OutcomeForm(newExpense: $newExpense, strPrice: $strPrice)
                } else {
                    IncomeForm(newIncome: $newIncome, strIncome: $strIncome)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("Annulla")
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Picker("Nuovo movimento", selection: $NewMovementType) {
                        Text("Uscita").tag(true)
                        Text("Entrata").tag(false)
                    }
                    .pickerStyle(.segmented)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if NewMovementType {
                        Button {
                            let strPriceFormatted = strPrice.replacingOccurrences(of: ",", with: ".")
                            newExpense.price = Double(strPriceFormatted)!
                            AppStorage.addExpense(newExpense)
                            isPresentedForm.toggle()
                        } label: {
                            Text("Aggiungi")
                                .fontWeight(.semibold)
                        }
                    } else {
                        Button {
                            let strIncomeFormatted = strIncome.replacingOccurrences(of: ",", with: ".")
                            newIncome.income = Double(strIncomeFormatted)!
                            AppStorage.addIncome(newIncome)
                            isPresentedForm.toggle()
                        } label: {
                            Text("Aggiungi")
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
    }
}

struct NewExpenseFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewMovementFormView(isPresentedForm: .constant(true))
    }
}
