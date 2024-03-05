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
            Image(systemName: "eurosign.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            VStack(alignment: .leading) {
                Text(expense.description)
                    .font(.body)
                    .fontWeight(.semibold)
                Text("\(expense.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.callout)
            }
            .padding(.leading, 10)
            Spacer()
            Text("\(expense.amount, specifier: "%.2f")€")
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

struct CompactExpense_Previews: PreviewProvider {
    static var previews: some View {
        CompactExpenseView(expense: MockData.sampleExpense)
    }
}
