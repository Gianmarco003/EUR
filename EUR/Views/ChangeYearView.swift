//
//  ChangeYearView.swift
//  EUR
//
//  Created by Gianmarco on 10/03/24.
//

import SwiftUI

struct ChangeYearView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @Binding var isPresentedChangeYear: Bool
    @Binding var year: Int
    @State var selectedYearList = Date().get(.year)

    var body: some View {
        NavigationStack() {
            List(AppStorage.getFirstYear()...Date().get(.year), id: \.self) {newYear in
                Button {
                    year = newYear
                    isPresentedChangeYear.toggle()
                } label: {
                    Text(String(newYear))
                }
            }
            .navigationTitle("Seleziona un anno")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedChangeYear.toggle()
                    } label: {
                        Text("Indietro")
                    }
                }
            }
        }
    }
}

struct ChangeYearView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeYearView(isPresentedChangeYear: .constant(true), year: .constant(2024))
    }
}
