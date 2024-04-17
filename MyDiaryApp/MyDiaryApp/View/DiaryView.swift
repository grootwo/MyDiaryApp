//
//  DiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct DiaryView: View {
    @State var showEditDiaryView = false
    var diary: Diary
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(diary.date.formatted(date: .complete, time: .omitted))
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
                EditDiaryView(showEditDiaryView: $showEditDiaryView, diary: diary, date: diary.date, title: diary.title, emoji: diary.emoji, textList: diary.paragraph)
            })
        }
        .padding()
    }
}


#Preview {
    DiaryView(diary: Diary(date: Date(), title: "Diary title", emoji: "❔", paragraph: ["paragraph 1", "paragraph 2"]))
}
