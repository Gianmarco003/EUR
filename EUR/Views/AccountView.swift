//
//  AccountView.swift
//  EUR
//
//  Created by Gianmarco on 02/03/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var AppStorage = PermanentStorage()
    @State var nomeCategoria = ""
    
    var body: some View {
        NavigationStack {
            List{
                NavigationLink("Categories") {
                    List {
                        Section("New category") {
                            TextField("Nome", text: $nomeCategoria)
                            Button {
                                AppStorage.addCategory(NewCategory: nomeCategoria)
                                nomeCategoria = ""
                            } label: {
                                Text("Add category")
                            }
                        }
                        Section("All categories") {
                            ForEach(AppStorage.getCategories(), id: \.self)
                            { category in
                                Text(category)
                            }
                            .onDelete (perform: AppStorage.deleteCategory)
                        }
                    }
                    .navigationTitle("Categories")
                }
                NavigationLink("Sviluppatore") {
                    DevView()
                        .navigationTitle("Stuff")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
