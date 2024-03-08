//
//  SummaryView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI

struct SummaryView: View {
    
    @StateObject var AppStorage = ExpensesAppStorage()
    @State var isPresentedForm: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView(){
                List {
                    ForEach(AppStorage.getExpenses()) { expense in
                        CompactExpenseView(expense: expense)
                    }
                    .onDelete (perform: AppStorage.deleteItems)
                }
                .navigationTitle("Expenses")
                .toolbar() {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("Add expense")
                    }
                }
            }
            .sheet(isPresented: $isPresentedForm) {
                NewExpenseFormView(isPresentedForm: $isPresentedForm)
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
