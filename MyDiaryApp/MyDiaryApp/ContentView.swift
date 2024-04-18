//
//  ContentView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var diaries = [
        Diary(date: ContentView.dateFormat.date(from: "2024/04/16")!, title: "건.뜨.", emoji: "🧶", paragraph: ["매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지...", "매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지. 매일 뜨개질을 하고 싶다. 내일도 뜨개질 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/15")!, title: "여름이네..", emoji: "🌤️", paragraph: ["벌써 날씨가 여름 같다. 아직 봄도 안 끝난 4월인데 지구온난화가 심한가 보다.", "여름인 만큼 밖은 울창하고 초록색이다."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/09")!, title: "수영장의 물 먹는 하마", emoji: "🌊", paragraph: ["매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지. 매일 수영을 하고 싶다. 내일도 수영 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/04/01")!, title: "유도 강도", emoji: "🥋", paragraph: ["매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지. 매일 유도를 하고 싶다. 내일도 유도 해야지."]),
        Diary(date: ContentView.dateFormat.date(from: "2024/03/28")!, title: "뜨개 마술사", emoji: "🧙", paragraph: ["뜨개질을 하다 보니 삶이 윤택해진다. 나는 뜨개 마술사인가 보다.", "뜨개 가보자고!"]),
        Diary(date: ContentView.dateFormat.date(from: "2024/03/27")!, title: "나으 챌린지", emoji: "💻", paragraph: ["나으 챌린지는 늘 어려웠다. 팀원들과 함께 이걸 어떻게 해결할지 고민했다. 그리고 아카데미 밖에서는 챌린지를 수월하게 해결할 수 있는 도구가 없는데, 어떻게 잘 해낼 수 있을까?", "그나저나 다음주부터 수영 수업을 들을 생각에 기쁘다. 집에 가면 수영 준비물을 잘 챙겨와야지.", "오늘은 고민 그만하고 이제 자야겠다."]),
    ]
    @State var isCalendarView = true
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/M/d"
        return formatter
    }()
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        ViewToggle(isCalendarView: $isCalendarView)
                            .padding(.horizontal, 20)
                    }
                    if isCalendarView {
                        CalendarDiaryView()
                    } else {
                        ListDiaryView(diaries: $diaries)
                    }
                }
                FixedView(diaries: $diaries)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
