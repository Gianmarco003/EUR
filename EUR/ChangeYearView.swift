//
//  ChangeYearView.swift
//  EUR
//
//  Created by Gianmarco on 10/03/24.
//

import SwiftUI

struct ChangeYearView: View {
    
    @Binding var isPresentedChangeYear: Bool
    @Binding var selectedYear: Int
    @State var selectedYearList = Date().get(.year)
    
    var body: some View {
        NavigationView() {
            List {
                Picker("Year", selection: $selectedYearList) {
                        Text("2024").tag(2024)
                        Text("2023").tag(2023)
                        Text("2022").tag(2022)
                    }
            }
            .navigationTitle("Select year")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedChangeYear.toggle()
                    } label: {
                        Text("Back")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        selectedYear = selectedYearList
                        isPresentedChangeYear.toggle()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

struct ChangeYearView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeYearView(isPresentedChangeYear: .constant(true), selectedYear: .constant(2024))
    }
}
