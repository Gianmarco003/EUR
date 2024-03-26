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
    var price: Double
    var date: Date
    var category: String
}

struct Income: Identifiable, Codable {
    var id = UUID()
    var description: String
    var income: Double
    var date: Date
}

struct MockData {
    static var sampleExpense = Expense(description: "description",
                                       price: 23.5,
                                       date: Date(),
                                       category: "Nessuna")
    static var sampleIncome = Income(description: "description",
                                       income: 5000,
                                       date: Date())
    
    static var sampleExpenses = [Expense(description: "Uno",
                                         price: 1,
                                         date: Date(),
                                         category: ""),
                                 Expense(description: "Due",
                                         price: 1,
                                         date: Date(),
                                         category: ""),
                                 Expense(description: "Tre",
                                         price: 1,
                                         date: Date(),
                                         category: "")]
}

