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
    
    func getExpensesByMonth (Month: Int, Year: Int) -> [Expense] {
        
        var expensesByMonth: [Expense] = []
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                if (expense.date.get(.month) == Month) {
                    expensesByMonth.append(expense)
                }
            }
        }
        
        return expensesByMonth
    }
    
    func getTotalExpensesByMonth (Month: Int, Year: Int) -> Double {
        var totalExpensesByMonth: Double = 0
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                if (expense.date.get(.month) == Month) {
                    totalExpensesByMonth += expense.price                }
            }
        }
        return totalExpensesByMonth
    }
    
}
