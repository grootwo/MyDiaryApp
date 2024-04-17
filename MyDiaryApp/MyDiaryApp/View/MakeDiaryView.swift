//
//  MakeDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/16/24.
//

import SwiftUI
import MCEmojiPicker


struct MakeDiaryView: View {
    @Binding var showMakeDiaryView: Bool
    @State var date = Date()
    @State var title = ""
    @State var emoji = "❔"
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
                        print("save new diary clicked")
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
    MakeDiaryView(showMakeDiaryView: .constant(true))
}
