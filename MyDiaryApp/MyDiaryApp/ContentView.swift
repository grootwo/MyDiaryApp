//
//  ContentView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var isCalendarView = true
    var body: some View {
        ZStack {
            FixedView(isCalendarView: $isCalendarView)
            if isCalendarView {
                CalendarView()
            } else {
                ListDiaryView()
            }
        }
    }
}

#Preview {
    ContentView()
}
