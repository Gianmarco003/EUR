//
//  IncomeView.swift
//  EUR
//
//  Created by Gianmarco on 21/03/24.
//

import SwiftUI

struct IncomeView: View {

    @StateObject var AppStorage = PermanentStorage()
    @State var isPresentedForm: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(AppStorage.getIncomes()) { income in
                    CompactIncomeView(income: income)
                }
            }
            .navigationTitle("Incomes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedForm.toggle()
                    } label: {
                        Text("New income")
                    }
                }
            }
        }
    }
}

struct IncomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView()
    }
}
