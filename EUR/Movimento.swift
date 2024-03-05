//
//  Movimento.swift
//  EUR
//
//  Created by Gianmarco on 29/02/24.
//

import SwiftUI

struct Expense: Decodable, Identifiable {
    let id = UUID()
    let descrizione: String
    let importo: Double
    let data: Date
    let categoria: String
}

struct MockData {
    static let sampleExpense = Expense(descrizione: "descrizione", importo: 23.5, data: Date(), categoria: "Nessuna")
}
