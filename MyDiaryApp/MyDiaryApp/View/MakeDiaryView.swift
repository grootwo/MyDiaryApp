//
//  MakeDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/16/24.
//

import SwiftUI
import MCEmojiPicker


struct MakeDiaryView: View {
    @Binding var diaries: [Diary]
    @Binding var showMakeDiaryView: Bool
    @State var date = Date()
    @State var title = ""
    @State var emoji = "😶"
    @State var showEmojiPicker = false
    @State var textList = [""]
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        DatePicker("날짜", selection: $date, displayedComponents: [.date])
                            .labelsHidden()
                        Spacer()
                        Button(action: {
                            print("new emoji clicked")
                            showEmojiPicker = true
                        }, label: {
                            Text(emoji)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        })
                        .emojiPicker(isPresented: $showEmojiPicker, selectedEmoji: $emoji)
                    }
                    .padding(.vertical, 20)
                    TextField("제목을 입력하세요", text: $title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    Divider()
                    ForEach($textList, id: \.self) { $text in
                        CustomTextFieldView(text: $text)
                        Divider()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            print("new paragrah button clicked")
                            textList.append("")
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                        })
                        Spacer()
                    }
                    
                }
            }
            .padding()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        print("save new diary clicked")
                        diaries.append(Diary(date: date, title: title, emoji: emoji, paragraph: textList))
                        print(diaries)
                        showMakeDiaryView = false
                    }, label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.accent)
                    })
                }
            }
            .padding()
        }
    }
}

struct CustomTextFieldView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("내용을 입력하세요", text: $text, axis: .vertical)
    }
}

#Preview {
    MakeDiaryView(diaries: .constant([
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지.", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지..."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/09")!, title: "수영장", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/01")!, title: "유도 강도", emoji: "🥋", paragraph: ["매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지."]),
    ]), showMakeDiaryView: .constant(true))
}
