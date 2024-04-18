//
//  DiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct DiaryView: View {
    @State var showEditDiaryView = false
    @State var showAlert = false
    @Binding var diaries: [Diary]
    @Binding var diary: Diary
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(diary.date.formatted(date: .complete, time: .omitted))
                        Text("\(diary.date, formatter: ContentView.dateFormat)")
                        Spacer()
                        Text(diary.emoji)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    Text(diary.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Divider()
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(diary.paragraph, id: \.self) { p in
                            Text(p)
                            Divider()
                        }
                    }
                }
                
            }
            HStack {
                Spacer()
                VStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        print("delete diary clicked")
                        showAlert = true
                    }, label: {
                        Image(systemName: "trash.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.accent)
                    })
                    Button(action: {
                        print("edit diary clicked")
                        showEditDiaryView = true
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.accent)
                    })
                }
            }
            .padding()
            .sheet(isPresented: $showEditDiaryView, content: {
                EditDiaryView(showEditDiaryView: $showEditDiaryView, diary: $diary, date: diary.date, title: diary.title, emoji: diary.emoji, textList: diary.paragraph)
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("일기 삭제"), message: Text("이 일기를 삭제할까요?"), primaryButton: .default(
                    Text("취소"),
                    action: {
                        print("cancel deleting diary")
                    }
                ), secondaryButton: .destructive(
                    Text("삭제"),
                    action: {
                        print("delete diary")
                        diaries.remove(at: diaries.firstIndex(of: diary)!)
                    }
                ))
            }
        }
        .padding()
    }
}


#Preview {
    DiaryView(diaries: .constant([
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/09")!, title: "수영장", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/01")!, title: "유도 강도", emoji: "🥋", paragraph: ["매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지."]),
    ]), diary: .constant(Diary(date: Date(), title: "Diary title", emoji: "❔", paragraph: ["paragraph 1", "paragraph 2"])))
}
