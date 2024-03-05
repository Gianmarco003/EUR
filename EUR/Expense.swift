//
//  Expense.swift
//  EUR
//
//  Created by Gianmarco on 29/02/24.
//

import SwiftUI

struct Expense: Identifiable {
    var id = UUID()
    var description: String
    var amount: Double
    var date: Date
    var category: String
}

struct MockData {
    static var sampleExpense = Expense(description: "description",
                                       amount: 23.5,
                                       date: Date(),
                                       category: "Nessuna")
    
    static var sampleExpenses = [Expense(description: "Uno",
                                         amount: 1,
                                         date: Date(),
                                         category: ""),
                                 Expense(description: "Due",
                                         amount: 1,
                                         date: Date(),
                                         category: ""),
                                 Expense(description: "Tre",
                                         amount: 1,
                                         date: Date(),
                                         category: "")]
}

final class Summary: ObservableObject{
    @Published var expenses: [Expense] = []
    
    func add(_ expense: Expense) {
        expenses.append(expense)
    }
    
    func deleteItems(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}
