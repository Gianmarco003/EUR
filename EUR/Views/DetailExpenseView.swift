//
//  DetailExpenseView.swift
//  EUR
//
//  Created by Gianmarco on 14/03/24.
//

import SwiftUI

struct DetailExpenseView: View {
    
    @Binding var expense: Expense
    @State var isPresentEditForm = false
    
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
                Text(expense.category)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text("\(expense.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .padding()
            Spacer()
        }
        .toolbar() {
            ToolbarItem {
                Button {
                    isPresentEditForm.toggle()
                } label: {
                    Image(systemName: "pencil.circle")
                }
            }
        }
        .sheet(isPresented: $isPresentEditForm, content: {
            EditOutcomeView(isPresentEditForm: $isPresentEditForm, oldExpense: $expense)
        })
    }
}

struct DetailExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailExpenseView(expense: .constant(MockData.sampleExpense))
    }
}
