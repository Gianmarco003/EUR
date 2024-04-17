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
                NavigationLink("Categorie") {
                    List {
                        Section("Nuova categoria") {
                            TextField("Nome", text: $nomeCategoria)
                            Button {
                                AppStorage.addCategory(NewCategory: nomeCategoria)
                                nomeCategoria = ""
                            } label: {
                                Text("Aggiungi")
                            }
                        }
                        Section("Tutte le categorie") {
                            ForEach(AppStorage.getCategories(), id: \.self)
                            { category in
                                Text(category)
                            }
                            .onDelete (perform: AppStorage.deleteCategory)
                        }
                    }
                    .navigationTitle("Categorie")
                }
                NavigationLink("Sviluppatore") {
                    DevView()
                        .navigationTitle("Avanzate")
                }
            }
            .navigationTitle("Impostazioni")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
