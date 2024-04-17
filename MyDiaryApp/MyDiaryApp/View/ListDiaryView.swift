//
//  ListDiaryView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ListDiaryView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(diaries, id: \.id) { diary in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(diary.title)
                                .font(.title2)
                            Spacer()
                            Text(diary.date.formatted(date: .complete, time: .omitted))
                                .font(.subheadline)
                            Text(diary.emoji)
                                .font(.subheadline)
                        }
                        .padding(.bottom, 10)
                        Text(diary.paragraph[0])
                        Divider()
                    }
                    .padding(.vertical, 10)
                }
            }
            .padding(.top, 60)
        }
        .padding()
    }
}

#Preview {
    ListDiaryView()
}
