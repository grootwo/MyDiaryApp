//
//  ContentView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var diaries = [
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/9")!, title: "수영장", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/01")!, title: "유도 강도", emoji: "🥋", paragraph: ["매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지."]),
    ]
    @State var isCalendarView = true
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/M/d"
        return formatter
    }()
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        ViewToggle(isCalendarView: $isCalendarView)
                    }
                    if isCalendarView {
                        CalendarDiaryView()
                    } else {
                        ListDiaryView(diaries: $diaries)
                    }
                }
                FixedView(diaries: $diaries)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
