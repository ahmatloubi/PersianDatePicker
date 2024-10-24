//
//  PersianDatePicker.swift
//  PersianDatePicker
//
//  Created by AmirHossein Matloubi on 8/2/1403 AP.
//

import SwiftUI
import Combine

struct PersianDatePicker: View {
    @StateObject var controller = PersianDatePickerObservable()
    
    var body: some View {
        VStack {
            
            datePickView
            
            HStack {
                Text(controller.datePickerTitle)
                Spacer()
                
                Button(controller.selectedDateTitle) {
                    controller.isDayPickerPresented.toggle()
                }
                
                Menu("Some menu") {
                    dayPickerView
                }
                Button(controller.selectedHourTitle) {
                    
                }
                
                
            }
            DatePicker("tite", selection: $controller.selectedDate)
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .popover(isPresented: $controller.isDayPickerPresented, attachmentAnchor: .point(.top),content: {
            dayPickerView
                .presentationCompactAdaptation(.popover)
        })
    }
    
    var dayPickerView: some View {
        Toggle("Title", isOn: $controller.isSelected)
    }
    
    var datePickView: some View {
        Grid {
            GridRow {
                ForEach(controller.dayNames) { dayName in
                    Text(dayName.dayName)
                        .font(.system(size: 12))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.secondary)
                }
            }
            
            GridRow {
                
            }
            
            
            
        }
    }
}

extension PersianDatePicker {
    class PersianDatePickerObservable: ObservableObject {
        
        private var cancellables = Set<AnyCancellable>()
        @Published var selectedDate = Date()
        @Published var datePickerTitle = "Persian Date Picker"
        
        @Published var selectedDateTitle = ""
        @Published var selectedHourTitle = ""
        
        private var dateFormatter = DateFormatter()
        private var hourFormatter = DateFormatter()
        
        @Published var isHourSelectionPopoverPreseneted = false
        
        let dayNames = [DayName(dayName: "شنبه"), DayName(dayName: "یک‌شنبه"), DayName(dayName: "دوشنبه"), DayName(dayName: "سه‌شنبه"), DayName(dayName: "چهارشنبه"), DayName(dayName: "پنج‌شنبه"), DayName(dayName: "جمعه"),]
        
        @Published var isDayPickerPresented = false
        @Published var isSelected = false
        
        init() {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            hourFormatter.dateFormat = "HH:mm"
            $selectedDate
                .sink {[weak self] date in
                    guard let self else { return }
                    self.selectedDateTitle = dateFormatter.string(from: date)
                    self.selectedHourTitle = hourFormatter.string(from: date)
                }
                .store(in: &cancellables)
                
        }
        
    }
}

#Preview {
    PersianDatePicker()
}
