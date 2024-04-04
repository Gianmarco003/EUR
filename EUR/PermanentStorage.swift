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
        if !categoriesStorage.contains(NewCategory) && !NewCategory.isEmpty {
            categoriesStorage.append(NewCategory)
            categoriesStorage.sort()
        }
        categoriesStorage.remove(at: categoriesStorage.firstIndex(of: "None")!)
        categoriesStorage.insert("None", at: 0)
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
        if !categoriesStorage.contains("None") {
            addCategory(NewCategory: "None")
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
    
    func getTotalByYear (Year: Int) -> Double {
        var totalByYear: Double = 0
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                totalByYear -= expense.price
            }
        }
        
        for income in incomesStorage {
            if (income.date.get(.year) == Year) {
                totalByYear += income.income
                
            }
        }
        
        return totalByYear
    }
    
    func getTotalExpensesByMonth (Month: Int, Year: Int) -> Double {
        var totalByMonth: Double = 0
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                if (expense.date.get(.month) == Month) {
                    totalByMonth -= expense.price
                }
            }
        }
        return totalByMonth
    }
    
    func getTotalExpensesByYear (Year: Int) -> Double {
        var totalByYear: Double = 0
        
        for expense in expensesStorage {
            if (expense.date.get(.year) == Year) {
                totalByYear -= expense.price
            }
        }
        return totalByYear
    }
    
    func getTotalIncomesByMonth (Month: Int, Year: Int) -> Double {
        var totalByMonth: Double = 0
        
        
        for income in incomesStorage {
            if (income.date.get(.year) == Year) {
                if (income.date.get(.month) == Month) {
                    totalByMonth += income.income
                }
            }
        }
        
        
        return totalByMonth
    }
    
    func getTotalIncomesByYear (Year: Int) -> Double {
        var totalByYear: Double = 0
        
        for income in incomesStorage {
            if (income.date.get(.year) == Year) {
                totalByYear += income.income
            }
        }
        
        return totalByYear
    }
    
    func chartBarMarkExpensesByMonth (year: Int) -> [BarChartElement] {
        var chartByMonthArray: [BarChartElement] = []
        
        for month in 1...12 {
            chartByMonthArray.append(.init(x: Date.from(year: year, month: month, day: 1), y: -(getTotalExpensesByMonth(Month: month, Year: year))))
        }
        return chartByMonthArray
    }
    
    func chartBarMarkIncomesByMonth (year: Int) -> [BarChartElement] {
        var chartByMonthArray: [BarChartElement] = []
        
        for month in 1...12 {
            chartByMonthArray.append(.init(x: Date.from(year: year, month: month, day: 1), y: getTotalIncomesByMonth(Month: month, Year: year)))
        }
        return chartByMonthArray
    }
    
    func deltaByMonth (month: Int, year: Int) -> Double {
        let expenses = getTotalExpensesByMonth(Month: month, Year: year)
        let incomes = getTotalIncomesByMonth(Month: month, Year: year)
        let delta: Double = ((incomes + expenses) / incomes) * 100
        if delta.isNaN {
            return 0
        } else {
            return delta
        }    }
    
    func deltaByYear (year: Int) -> Double {
        let expenses = getTotalExpensesByYear(Year: year)
        let incomes = getTotalIncomesByYear(Year: year)
        let delta: Double = ((incomes + expenses) / incomes) * 100
        if delta.isNaN {
            return 0
        } else {
            return delta
        }
    }
    
    func chartCategories(year: Int) -> [PieChartElement] {
        
        var expensesByCategories: [PieChartElement] = []
        var totaleCategoria: Double = 0
        let totaleSpese = getTotalExpensesByYear(Year: year)
        
        for category in categoriesStorage {
            for expense in expensesStorage {
                if expense.category == category {
                    totaleCategoria += expense.price
                }
            }
            totaleCategoria = (totaleCategoria * 100) / (-totaleSpese)
            if totaleCategoria.isFinite {
                expensesByCategories.append(PieChartElement.init(name: category + " (\(Int(totaleCategoria))%)", value: totaleCategoria))
            }
            totaleCategoria = 0
        }
        return expensesByCategories.sorted(by: { $0.value > $1.value })
    }
    func editOutcome (oldOutcome: Expense, newOutcome: Expense) {
        for index in 0...expensesStorage.count-2 {
            if expensesStorage[index].id == oldOutcome.id {
                expensesStorage.remove(at: index)
            }
        }
        addExpense(newOutcome)
    }
}
