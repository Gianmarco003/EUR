//
//  SummaryView.swift
//  EUR
//
//  Created by Gianmarco on 01/03/24.
//

import SwiftUI
import Charts

struct SummaryView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: OutcomesIncomesView()) {
                        SummaryCompactView(month: Date().get(.month), year: Date().get(.year))
                    }
                }
                Section {
                    Text("Charts")
                }
            }
            .navigationTitle("Summary")
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}

