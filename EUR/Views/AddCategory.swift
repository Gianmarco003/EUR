//
//  AddCategory.swift
//  EUR
//
//  Created by Gianmarco Zecchinato on 01/04/24.
//

import SwiftUI

struct AddCategory: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var nomeCategoria = ""
    @Binding var isPresentAddCategory: Bool
    
    var body: some View {
        List {
            Section {
                TextField("Nome", text: $nomeCategoria)
                Button {
                    AppStorage.addCategory(NewCategory: nomeCategoria)
                    nomeCategoria = ""
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    AddCategory(isPresentAddCategory: .constant(true))
}
