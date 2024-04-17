//
//  EditDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/17/24.
//

//
//  MakeDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/16/24.
//

import SwiftUI
import MCEmojiPicker


struct EditDiaryView: View {
    @Binding var showEditDiaryView: Bool
    @Binding var diary: Diary
    @State var date: Date
    @State var title: String
    @State var emoji: String
    @State var showEmojiPicker = false
    @State var textList: [String]
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(diary.date.formatted(date: .complete, time: .omitted))
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
                                .frame(width: 50, height: 50)
                                .foregroundColor(.accent)
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
                        print("save edited diary clicked")
                        diary.date = date
                        diary.emoji = emoji
                        diary.paragraph = textList
                        showEditDiaryView = false
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

#Preview {
    EditDiaryView(showEditDiaryView: .constant(true), diary: .constant(
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지..."])), date: Date(), title: "Title", emoji: "🤨", textList: ["paragraph 1", "paragraph 2"])
}
