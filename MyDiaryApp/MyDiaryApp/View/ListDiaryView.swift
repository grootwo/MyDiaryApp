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
            Text("Text List View")
            FixedView(isCalendarView: false)
        }
    }
}

#Preview {
    ListDiaryView()
}
