//
//  FixedView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct FixedView: View {
    @Binding var isCalendarView: Bool
    @State var searchText = ""
    @State var showMakeDiaryView = false
    var body: some View {
        VStack {
            HStack {
                SearchView(textInput: $searchText)
                ViewToggle(isCalendarView: $isCalendarView)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showMakeDiaryView = true
                }, label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.accent)
                })
            }
            .sheet(isPresented: $showMakeDiaryView, content: {
                MakeDiaryView(showMakeDiaryView: $showMakeDiaryView)
            })
        }
        .padding()
        .background(Color.clear)
    }
}

#Preview {
    FixedView(isCalendarView: .constant(true))
}
