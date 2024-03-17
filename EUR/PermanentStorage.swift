//
//  ExpensesAppStorage.swift
//  EUR
//
//  Created by Gianmarco on 07/03/24.
//

import SwiftUI



final class PermanentStorage: ObservableObject{
    @AppStorage("expenses") private var expensesStorage: [Expense] = []
    @AppStorage("categories") private var categoriesStorage: [String] = ["None",
                                                                         "Food",
                                                                         "Gas",
                                                                         "Clothes"]
    
    func addExpense(_ expense: Expense) {
        expensesStorage.append(expense)
        expensesStorage.sort { $0.date > $1.date }
    }
    
    func addCategory(NewCategory: String) {
        categoriesStorage.append(NewCategory)
        categoriesStorage.sort { $0 > $1 }
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expensesStorage.remove(atOffsets: offsets)
    }
    
    func deleteAllExpenses() {
        expensesStorage = []
    }

    
    func deleteCategories() {
        categoriesStorage = ["None"]
    }
    
    func getExpenses() -> [Expense] {
        return expensesStorage
    }
    
    func getCategories() -> [String] {
        return categoriesStorage
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
