//
//  Expense.swift
//  EUR
//
//  Created by Gianmarco on 29/02/24.
//

import SwiftUI

struct Expense: Identifiable, Codable {
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

