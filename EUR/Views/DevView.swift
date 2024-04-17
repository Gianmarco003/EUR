//
//  ImportView.swift
//  EUR
//
//  Created by Gianmarco on 15/03/24.
//

import SwiftUI
import TabularData
import UniformTypeIdentifiers

struct DevView: View {
    
    @State private var importing = false
    @State private var exporting = false
    @StateObject var AppStorage = PermanentStorage()
    @State var text = ""
    @State var avanzate = false
    
    var body: some View {
        List {
            Button("Importa spese") {
                importing = true
            }
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: [.commaSeparatedText]
            ) { result in
                switch result {
                case .success(let file):
                    let result = read(from: file)
                    switch result {
                    case .success(let text):
                        self.text += text
                    case .failure(let error):
                        print(error)
                    }
                    
                    let FILE = CSVParsing(CSV: text)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    for row in FILE {
                        if !AppStorage.getCategories().contains(row.category) {
                            AppStorage.addCategory(NewCategory: row.category)
                        }
                        var price = row.price.replacingOccurrences(of: ",", with: ".")
                        price = price.replacingOccurrences(of: "€", with: "")
                        price = price.trimmingCharacters(in: .whitespaces)
                        AppStorage.addExpense(Expense(description: row.description,
                                                      price: Double(price)!,
                                                      date: dateFormatter.date(from: row.date)!,
                                                      category: row.category))
                        print(row)
                    }
                    text = ""
                    
                case .failure(_):
                    print("Error while importing!")
                }
            }
            Button("Esporta spese") {
                exporting.toggle()
            }
            .fileExporter(isPresented: $exporting,
                          document: AppStorage.exportExpenses(),
                          contentType: .commaSeparatedText,
                          defaultFilename: "CSVExpenses.csv") {
                result in
                switch result {
                case .success(let url):
                    print("Saved to \(url)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            Toggle("Avanzate", isOn: $avanzate)
            if avanzate {
                Button {
                    AppStorage.deleteCategories()
                } label: {
                    Text("Cancella categorie")
                }
                Button {
                    AppStorage.deleteAllMovements()
                } label: {
                    Text("Cancella movimenti")
                }
            }
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        DevView()
    }
}
