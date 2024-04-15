//
//  CalendarDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct CalendarDiaryView: View {
    @State var selectedDay = Date()
    @State var searchText = ""
    var body: some View {
        ZStack {
            DatePicker("", selection: $selectedDay, displayedComponents: [.date])
                .datePickerStyle(.graphical)
            VStack {
                HStack {
                    SearchView(textInput: $searchText)
                    ViewToggle(isCalendarView: true)
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        print("new diary button clicked")
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalendarDiaryView()
}
