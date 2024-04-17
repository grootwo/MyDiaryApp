//
//  DiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct DiaryView: View {
    var diary: DiaryModel
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(diary.date.formatted(date: .complete, time: .omitted))
                        Spacer()
                        Text(diary.emoji)
                    }
                    Text(diary.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Divider()
                    List {
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
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.accent)
                    })
                }
            }
            .padding()
        }
        .padding()
    }
}


#Preview {
    DiaryView(diary: DiaryModel(date: Date(), title: "Diary title", emoji: "❔", paragraph: ["paragraph 1", "paragraph 2"]))
}
