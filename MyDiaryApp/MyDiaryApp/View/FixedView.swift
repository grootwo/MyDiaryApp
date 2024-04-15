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
        NavigationStack {
                VStack {
                    HStack {
                        SearchView(textInput: $searchText)
                        ViewToggle(isCalendarView: isCalendarView)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: DiaryView()) {
                            Image(systemName: "pencil.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                }
                .padding()
        }
    }
}

#Preview {
    FixedView(isCalendarView: false)
}
