//
//  CsvParsing.swift
//  EUR
//
//  Created by Gianmarco on 17/03/24.
//

import SwiftUI

struct ColumnsName {
    var date = ""
    var category = ""
    var price = ""
    var description = ""
   
    //EUR
//    init(raw: [String]) {
//        description = raw[0]
//        price = raw[1]
//        date = raw[2]
//        category = raw[3]
//    }
    
    //SPENDEE
    init(raw: [String]) {
        date = raw[0]
        category = raw[1]
        price = raw[2]
        description = raw[3]
    }
}

func CSVParsing (CSV: String) -> [ColumnsName] {

    var CSVToStruct = [ColumnsName]()
    
    //split the long string into an array of "rows" of data. Each is a string
    //detect "\n" carriage return, then split
    var rows = CSV.components(separatedBy: "\n")
    
    //remove header rows
    rows.removeFirst()
    
    //now loop around each row and split into columns
    for row in rows {
        let CSVColumns = row.description.components(separatedBy: ",")
        let CSVStruct = ColumnsName.init(raw: CSVColumns)
        CSVToStruct.append(CSVStruct)
    }
    
    return CSVToStruct
}

func read(from url: URL) -> Result<String,Error> {
  let accessing = url.startAccessingSecurityScopedResource()
  defer {
    if accessing {
      url.stopAccessingSecurityScopedResource()
    }
  }

  return Result { try String(contentsOf: url) }
}
