//
//  ViewToggle.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ViewToggle: View {
    var isCalendarView: Bool
    var body: some View {
        HStack {
            Button(action: {
                print("calendar button clicked")
            }, label: {
                Image(systemName: "calendar")
            })
            .padding()
            .background(isCalendarView ? .blue : .white)
            .foregroundColor(isCalendarView ? .white : .blue)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Button(action: {
                print("list button clicked")
            }, label: {
                Image(systemName: "list.bullet")
            })
            .padding()
            .background(isCalendarView ? .white : .blue)
            .foregroundColor(isCalendarView ? .blue : .white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}

#Preview {
    ViewToggle(isCalendarView: false)
}
