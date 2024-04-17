//
//  CategoryDetailView.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 16/04/24.
//

import SwiftUI

struct CategoryDetailView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    var category: String
    var year: Int
    
    var body: some View {
        List(AppStorage.getExpensesByCategory(Category: category, Year: year)) {expense in
            CompactExpenseView(expense: expense)
        }
        .navigationTitle(category)
    }
}

#Preview {
    CategoryDetailView(category: "None", year: 2024)
}
