//
//  CalendarView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/16/24.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDay = Date()
    var body: some View {
        DatePicker("", selection: $selectedDay, displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .padding()
    }
}

#Preview {
    CalendarView()
}
