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
        HStack {
            Text(controller.datePickerTitle)
            Spacer()

            Button(controller.selectedDateTitle) {
                
            }
            Button(controller.selectedHourTitle) {
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
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
