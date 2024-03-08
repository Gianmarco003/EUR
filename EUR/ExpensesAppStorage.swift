//
//  ExpensesAppStorage.swift
//  EUR
//
//  Created by Gianmarco on 07/03/24.
//

import SwiftUI



final class ExpensesAppStorage: ObservableObject{
    @AppStorage("expenses") private var expensesStorage: [Expense] = []
    
    func add(_ expense: Expense) {
        expensesStorage.append(expense)
    }
    
    func deleteItems(at offsets: IndexSet) {
        expensesStorage.remove(atOffsets: offsets)
    }
    
    func getExpenses() -> [Expense] {
        return expensesStorage
    }
    
    func getExpensesByMonth(Month: Date) -> [Expense] {
        
        var expensesByMonth: [Expense] = []
        
        for expense in expensesStorage {
            if (true) {
                
            }
        }
        
        return expensesByMonth
    }
    
}
