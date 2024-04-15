//
//  FixedView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct FixedView: View {
    var isCalendarView: Bool
    @State var searchText = ""
    var body: some View {
    VStack {
        HStack {
            SearchView(textInput: $searchText)
            ViewToggle(isCalendarView: isCalendarView)
        }
        Spacer()
        HStack {
            Spacer()
            Button(action: {
                print("new diary button clicked")
            }, label: {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
            })
        }
    }
    .padding()
    }
}

#Preview {
    FixedView(isCalendarView: false)
}
