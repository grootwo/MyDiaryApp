//
//  CalendarDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI
import FSCalendar

struct CalendarDiaryView: View {
    @State var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            // Passing the selectedDate as Binding
            CalendarViewRepresentable(selectedDate: $selectedDate)
        }
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    fileprivate var calendar = FSCalendar()
    @Binding var selectedDate: Date
    
    func makeUIView(context: Context) -> FSCalendar {
        // Setting delegate and dateSource of calendar to the
        // values we get from Coordinator
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        // Added the below code to change calendar appearance
        calendar.appearance.todayColor = .accent // 오늘 날짜 원
        calendar.appearance.selectionColor = .accent // 선택된 날짜 원
        calendar.appearance.titleWeekendColor = .accent // 주말 날짜 폰트 색
        calendar.appearance.titleTodayColor = .white // 오늘 날짜 폰트 색
        calendar.appearance.titleFont = .boldSystemFont(ofSize: 15)
        // returning the intialized calendar
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject,
                       FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarViewRepresentable
        
        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }
        // Implementing the didSelect method of FSCalendar
        // this is fired with the new date when user selects a new date
        // in the Calendar UI, we are setting our selectedDate Binding
        // var to this new date when this is triggered
        func calendar(_ calendar: FSCalendar,
                      didSelect date: Date,
                      at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
    }
}

#Preview {
    CalendarDiaryView()
}
