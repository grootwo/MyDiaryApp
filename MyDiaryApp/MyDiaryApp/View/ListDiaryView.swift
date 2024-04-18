//
//  ListDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ListDiaryView: View {
    @Binding var diaries: [Diary]
    var body: some View {
        ScrollView {
            ForEach($diaries, id: \.id) { $diary in
                NavigationLink(destination: DiaryView(diaries: $diaries, diary: $diary)) {
                    VStack(alignment: .leading) {
                        HStack {
                            if diary.title.count > 8 {
                                Text("\(diary.title.prefix(8))···")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            } else {
                                Text(diary.title)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            Text(diary.date.formatted(date: .complete, time: .omitted))
                                .font(.subheadline)
                            Text(diary.emoji)
                                .font(.subheadline)
                        }
                        .padding(.bottom, 5)
                        if diary.paragraph[0].count > 80 {
                            Text("\(diary.paragraph[0].prefix(80))···")
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        } else {
                            Text(diary.paragraph[0])
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        Divider()
                            .padding(.vertical, 15)
                    }
                }
                .foregroundColor(.black)
            }
        }
        .padding()
    }
}

#Preview {
    ListDiaryView(diaries: .constant([
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/09")!, title: "수영장", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/01")!, title: "유도 강도", emoji: "🥋", paragraph: ["매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지."]),
    ]))
}
