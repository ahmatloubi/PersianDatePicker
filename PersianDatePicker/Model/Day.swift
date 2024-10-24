//
//  Day.swift
//  PersianDatePicker
//
//  Created by AmirHossein Matloubi on 8/3/1403 AP.
//

import Foundation
class Day: Identifiable {
    
    let id = UUID()
    private let date: Date
    private let calendar: Calendar
    
    init(date: Date, calendar: Calendar = .current) {
        self.date = date
        self.calendar = calendar
    }
    
    private lazy var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    
    var dayNumber: Int? {
        dateComponents.day
    }
}
