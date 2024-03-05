//
//  SummaryView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct SummaryView: View {
    
    @EnvironmentObject var summary: Summary
    @State var isPresentedForm: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView(){
                ZStack{
                    List (summary.expenses) { expense in
                        CompactExpenseView(expense: expense)
                    }
                    List {
                        ForEach(summary.expenses) { expense in
                            CompactExpenseView(expense: expense)
                        }
                        .onDelete (perform: summary.deleteItems)
                    }
                    VStack {
                        Spacer()
                        Button {
                            isPresentedForm.toggle()
                        } label: {
                            Text("Add expense")
                                .fontWeight(.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                }
                .navigationTitle("Expenses")
            }
            .sheet(isPresented: $isPresentedForm) {
                NewExpenseFormView(isPresentedForm: $isPresentedForm, Expenses: $summary.expenses)
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
