//
//  ListDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ListDiaryView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("건.뜨.")
                                .font(.title2)
                            Spacer()
                            Text("2024년 4월 11일")
                                .font(.subheadline)
                            Text("🧶")
                                .font(.subheadline)
                        }
                        .padding(.bottom, 10)
                        Text("매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...")
                        Divider()
                    }
                    .padding(.vertical, 10)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("건.수.")
                                .font(.title2)
                            Spacer()
                            Text("2024년 4월 10일")
                                .font(.subheadline)
                            Text("🌊")
                                .font(.subheadline)
                        }
                        .padding(.bottom, 10)
                        Text("매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지...")
                        Divider()
                    }
                    .padding(.vertical, 10)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("건.뜨.")
                                .font(.title2)
                            Spacer()
                            Text("2024년 4월 11일")
                                .font(.subheadline)
                            Text("🧶")
                                .font(.subheadline)
                        }
                        .padding(.bottom, 10)
                        Text("매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...")
                        Divider()
                    }
                    .padding(.vertical, 10)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("건.수.")
                                .font(.title2)
                            Spacer()
                            Text("2024년 4월 10일")
                                .font(.subheadline)
                            Text("🌊")
                                .font(.subheadline)
                        }
                        .padding(.bottom, 10)
                        Text("매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지...")
                        Divider()
                    }
                    .padding(.vertical, 10)

                }
                .padding(.top, 60)
            }
            .padding()
            FixedView(isCalendarView: false)
        }
    }
}

#Preview {
    ListDiaryView()
}
