//
//  Date+Ext.swift
//  EUR
//
//  Created by Gianmarco on 10/03/24.
//

import SwiftUI

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    static func from(year: Int, month: Int, day: Int)
    -> Date {
        let components = DateComponents(year: year, month: month, day: day)
    return Calendar.current.date(from: components)!
    }
}
