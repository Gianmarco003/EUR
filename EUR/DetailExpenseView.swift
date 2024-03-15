//
//  DetailExpenseView.swift
//  EUR
//
//  Created by Gianmarco on 14/03/24.
//

import SwiftUI

struct DetailExpenseView: View {
    let expense: Expense
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "eurosign.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                Text("\(expense.price, specifier: "%.2f")€")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .padding()
            VStack {
                Text(expense.description)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("\(expense.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text(expense.category)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .padding()
            Spacer()
        }
    }
}

struct DetailExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailExpenseView(expense: MockData.sampleExpense)
    }
}
