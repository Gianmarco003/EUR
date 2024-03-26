//
//  ExpensesAppStorage.swift
//  EUR
//
//  Created by Gianmarco on 07/03/24.
//

import SwiftUI



final class PermanentStorage: ObservableObject{
    @AppStorage("expenses") private var expensesStorage: [Expense] = []
    @AppStorage("incomes") private var incomesStorage: [Income] = []
    @AppStorage("categories") private var categoriesStorage: [String] = ["None"]
    
    func addExpense(_ expense: Expense) {
        expensesStorage.append(expense)
        expensesStorage.sort { $0.date > $1.date }
    }
    
    func addIncome(_ income: Income) {
        incomesStorage.append(income)
        incomesStorage.sort { $0.income > $1.income }
    }
    
    func addCategory(NewCategory: String) {
        if !categoriesStorage.contains(NewCategory) {
            categoriesStorage.append(NewCategory)
            categoriesStorage.sort()
        }
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expensesStorage.remove(atOffsets: offsets)
    }
    
    func deleteIncome(at offsets: IndexSet) {
        incomesStorage.remove(atOffsets: offsets)
    }
    
    func deleteCategory(at offsets: IndexSet) {
        categoriesStorage.remove(atOffsets: offsets)
        if categoriesStorage.isEmpty {
            categoriesStorage = ["None"]
        }
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
    
    func getIncomes() -> [Income] {
        return incomesStorage
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
    
    func getIncomesByMonth (Month: Int, Year: Int) -> [Income] {
        
        var incomesByMonth: [Income] = []
        
        for income in incomesStorage {
            if (income.date.get(.year) == Year) {
                if (income.date.get(.month) == Month) {
                    incomesByMonth.append(income)
                }
            }
        }
        
        return incomesByMonth
    }
    
    func getTotalByMonth (Month: Int, Year: Int) -> Double {
        var totalByMonth: Double = 0
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                if (expense.date.get(.month) == Month) {
                    totalByMonth -= expense.price                }
            }
        }
        
        for income in incomesStorage {
            if (income.date.get(.year) == Year) {
                if (income.date.get(.month) == Month) {
                    totalByMonth += income.income                }
            }
        }
        
        return totalByMonth
    }
    func getTotalExpensesByMonth (Month: Int, Year: Int) -> Double {
        var totalByMonth: Double = 0
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                if (expense.date.get(.month) == Month) {
                    totalByMonth -= expense.price                }
            }
        }
        
        
        
        return totalByMonth
    }
    func getTotalIncomesByMonth (Month: Int, Year: Int) -> Double {
        var totalByMonth: Double = 0
        
        
        for income in incomesStorage {
            if (income.date.get(.year) == Year) {
                if (income.date.get(.month) == Month) {
                    totalByMonth += income.income                }
            }
        }
        
        
        return totalByMonth
    }
    
}
