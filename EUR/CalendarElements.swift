//
//  CalendarElements.swift
//  EUR
//
//  Created by Gianmarco on 10/03/24.
//

import SwiftUI

func getMonthName (Month: Int) -> String {
    switch Month {
    case 1:
        return "Gennaio"
    case 2:
        return "Febbraio"
    case 3:
        return "Marzo"
    case 4:
        return "Aprile"
    case 5:
        return "Maggio"
    case 6:
        return "Giugno"
    case 7:
        return "Luglio"
    case 8:
        return "Agosto"
    case 9:
        return "Settembre"
    case 10:
        return "Ottobre"
    case 11:
        return "Novembre"
    case 12:
        return "Dicembre"
    default:
        return "None"
    }
}

func getMonthNumber (Month: String) -> Int {
    switch Month {
    case "Gennaio":
        return 1
    case "Febbraio":
        return 2
    case "Marzo":
        return 3
    case "Aprile":
        return 4
    case "Maggio":
        return 5
    case "Giugno":
        return 6
    case "Luglio":
        return 7
    case "Agosto":
        return 8
    case "Settembre":
        return 9
    case "Ottobre":
        return 10
    case "Novembre":
        return 11
    case "Dicembre":
        return 12
    default:
        return 0
    }
}

public let months = ["Gennaio",
                     "Febbraio",
                     "Marzo",
                     "Aprile",
                     "Maggio",
                     "Giugno",
                     "Luglio",
                     "Agosto",
                     "Settembre",
                     "Ottobre",
                     "Novembre",
                     "Dicembre"]
