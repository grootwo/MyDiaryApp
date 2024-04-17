//
//  ContentView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var isCalendarView = true
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/M/d"
        return formatter
    }()
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
