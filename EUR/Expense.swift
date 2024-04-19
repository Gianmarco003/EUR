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

struct Investimento: Identifiable, Codable, Hashable {
    var id = UUID()
    var description: String
    var valore: Double
    var date: Date
}

struct BarChartElement: Identifiable {
    var id = UUID()
    var x: Date
    var y: Double
}

struct Category: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var fullname: String
    var value: Double
}

struct WidgetDataStruct {
    var totalByMonth: Double = 0
    var deltaByMonth: Double = 0
}

enum WidgetData {
    static let totalByMonth = 0
    static let deltaByMonth = 1
}

struct MockData {
    static var sampleExpense = Expense(description: "description",
                                       price: 23.5,
                                       date: Date(),
                                       category: "")
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

