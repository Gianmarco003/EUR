//
//  ImportView.swift
//  EUR
//
//  Created by Gianmarco on 15/03/24.
//

import SwiftUI
import TabularData
import UniformTypeIdentifiers

struct ImportView: View {
    
    @State private var importing = false
    @State private var exporting = false
    @StateObject var AppStorage = PermanentStorage()
    
    
    var body: some View {
        VStack {
            Button("Import") {
                importing = true
            }
            .buttonStyle(.bordered)
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: [.commaSeparatedText]
            ) { result in
                switch result {
                case .success(let file):
                    let data = try? String(contentsOf: file)
                    print("------------------------------------")
                    print(result)
                    print("------------------------------------")
                    
                    let FILE = CSVParsing(CSV: data!)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/mm/yyyy"
                    for row in FILE {
                        if !AppStorage.getCategories().contains(row.category) {
                            AppStorage.addCategory(NewCategory: row.category)
                        }
                        AppStorage.addExpense(Expense(description: row.description,
                                                      price: Double(row.price)!,
                                                      date: dateFormatter.date(from: row.date)!,
                                                      category: row.category))
                        print(row)
                    }
                    
                    
                case .failure(_):
                    print("Error while importing!")
                }
            }
            Button("Export") {
                exporting = true
                var CSVString = "Description;Price;Date;Categories\n"
                var CSVFile: Data = CSVString
                
            }
            .buttonStyle(.bordered)
            .fileExporter(isPresented: $exporting, documents: , contentType: .commaSeparatedText) {
                
            }
            Button {
                AppStorage.deleteCategories()
            } label: {
                Text("Delete categories")
            }
            .buttonStyle(.bordered)
            Button {
                AppStorage.deleteAllExpenses()
            } label: {
                Text("Delete expenses")
            }
            .buttonStyle(.bordered)
            
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}
