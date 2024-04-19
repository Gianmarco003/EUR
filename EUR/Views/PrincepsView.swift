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
            SummaryView(year: Date().get(.year))
                .tabItem{
                    Label("Riepilogo", systemImage: "list.bullet.rectangle")
                }
            InvestimentiView()
                .tabItem {
                    Label("Investimenti", systemImage: "chart.xyaxis.line")
                }
            AccountView()
                .tabItem {
                    Label("Impostazioni", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PrincepsView()
    }
}
