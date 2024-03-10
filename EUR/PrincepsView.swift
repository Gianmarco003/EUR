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
            SummaryView(selectedYear: Date().get(.year))
                .tabItem{
                    Label("Summary", systemImage: "list.bullet.rectangle")
                }
            DefermentView()
                .tabItem{
                    Label("Deferment", systemImage: "person.2.fill")
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
