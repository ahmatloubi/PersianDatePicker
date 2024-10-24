//
//  Date.swift
//  PersianDatePicker
//
//  Created by AmirHossein Matloubi on 8/3/1403 AP.
//

import Foundation

extension Date {
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self) ?? self
    }
}
