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
        NavigationStack {
            ZStack {
                if isCalendarView {
                    CalendarDiaryView()
                } else {
                    ListDiaryView()
                }
                FixedView(isCalendarView: $isCalendarView)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
