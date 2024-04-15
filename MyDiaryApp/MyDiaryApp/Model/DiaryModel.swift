//
//  DiaryModel.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import Foundation

struct DiaryModel {
    let id = UUID()
    var date: Date
    var title: String
    var emoji: String
    var paragraph: [String] = []
}

var diaries = [
    DiaryModel(date: Date(), title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지..."]),
    DiaryModel(date: Date(), title: "건.수.", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지..."]),
]
