//
//  ImportView.swift
//  EUR
//
//  Created by Gianmarco on 15/03/24.
//

import SwiftUI
import TabularData

struct ImportView: View {
    
    @State private var importing = false
    
    var body: some View {
        Button("Import") {
            importing = true
        }
        .fileImporter(
            isPresented: $importing,
            allowedContentTypes: [.commaSeparatedText]
        ) { result in
            switch result {
            case .success(let file):
                let data = try? String(contentsOf: file)
                print(result)
                
                
                
            case .failure(_):
                print("Error while importing!")
            }
        }    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}
