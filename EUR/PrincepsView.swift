//
//  ContentView.swift
//  EUR
//
//  Created by Gianmarco on 29/02/24.
//

import SwiftUI

struct PrincepsView: View {
    
    var body: some View {
        TabView {
            SummaryView()
                .tabItem{
                    Label("Summary", systemImage: "list.bullet.rectangle")
                }
            IncomeView()
                .tabItem{
                    Label("Incomes", systemImage: "banknote")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PrincepsView()
    }
}
