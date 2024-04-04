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
        return "January"
    case 2:
        return "February"
    case 3:
        return "March"
    case 4:
        return "April"
    case 5:
        return "May"
    case 6:
        return "June"
    case 7:
        return "July"
    case 8:
        return "August"
    case 9:
        return "September"
    case 10:
        return "October"
    case 11:
        return "November"
    case 12:
        return "December"
    default:
        return "None"
    }
}

func getMonthNumber (Month: String) -> Int {
    switch Month {
    case "January":
        return 1
    case "February":
        return 2
    case "March":
        return 3
    case "April":
        return 4
    case "May":
        return 5
    case "June":
        return 6
    case "July":
        return 7
    case "August":
        return 8
    case "September":
        return 9
    case "October":
        return 10
    case "November":
        return 11
    case "December":
        return 12
    default:
        return 0
    }
}

public let months = ["January",
                     "February",
                     "March",
                     "April",
                     "May",
                     "June",
                     "July",
                     "August",
                     "September",
                     "October",
                     "November",
                     "December"]
