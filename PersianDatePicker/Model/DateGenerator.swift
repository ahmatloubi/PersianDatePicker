//
//  DateGenerator.swift
//  PersianDatePicker
//
//  Created by AmirHossein Matloubi on 8/3/1403 AP.
//

import Foundation

class DateGenerator {
    var calendar: Calendar
    
    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }
    
    func dates(fromDate: Date, toDate: Date) -> [Date] {
        var date = fromDate.noon
        var dates: [Date] = []
        while date <= toDate.noon {
            dates.append(date)
            date = calendar.date(byAdding: .day, value: 1, to: date) ?? Date()
        }
        return dates
    }
    
    func generateMonth() {
        
    }
    
    func isLeapYear(year: Int) -> Bool {
        ((((((year - ((year > 0) ? 474 : 473)) % 2820) + 474) + 38) * 682) % 2816) < 682
    }
    
}
