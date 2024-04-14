//
//  CompactExpense.swift
//  EUR
//
//  Created by Gianmarco on 29/02/24.
//

import SwiftUI

struct CompactExpenseView: View {
    
    let expense: Expense
    
    var body: some View {
        HStack() {
//            Image(systemName: "minus.circle.fill")
//                .resizable()
//                .frame(width: 40, height: 40)
//                .foregroundColor(.red)
            VStack(alignment: .leading) {
                Text(expense.description)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(expense.category)
                    .font(.callout)
                Text("\(expense.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.callout)
            }
            Spacer()
            Text("\(expense.price, specifier: "%.2f")€")
                .font(.title2)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.foreground)
    }
}

struct CompactExpense_Previews: PreviewProvider {
    static var previews: some View {
        CompactExpenseView(expense: MockData.sampleExpense)
    }
}
