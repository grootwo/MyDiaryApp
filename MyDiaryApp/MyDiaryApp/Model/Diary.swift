//
//  DiaryModel.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import Foundation

struct Diary: Identifiable {
    let id = UUID()
    var date: Date
    var title: String
    var emoji: String
    var paragraph: [String]
}
