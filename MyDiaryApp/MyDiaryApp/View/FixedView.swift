//
//  FixedView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct FixedView: View {
    @Binding var diaries: [Diary]
    @State var showMakeDiaryView = false
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showMakeDiaryView = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.accent)
                })
            }
            .sheet(isPresented: $showMakeDiaryView, content: {
                MakeDiaryView(diaries: $diaries, showMakeDiaryView: $showMakeDiaryView)
            })
        }
        .padding()
        .background(Color.clear)
    }
}

#Preview {
    FixedView(diaries: .constant([
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지.", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/09")!, title: "수영장", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/01")!, title: "유도 강도", emoji: "🥋", paragraph: ["매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지."]),
    ]))
}
