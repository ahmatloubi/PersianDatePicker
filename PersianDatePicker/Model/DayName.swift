//
//  DayName.swift
//  PersianDatePicker
//
//  Created by AmirHossein Matloubi on 8/3/1403 AP.
//

import Foundation

class DayName: Identifiable {
    let id = UUID()
    let dayName: String
    init(dayName: String) {
        self.dayName = dayName
    }
}
