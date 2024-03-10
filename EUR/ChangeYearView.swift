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
    
    var body: some View {
        NavigationView() {
            Text("\(selectedYear)")
            .navigationTitle("Select year")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresentedChangeYear.toggle()
                    } label: {
                        Text("Back")
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
