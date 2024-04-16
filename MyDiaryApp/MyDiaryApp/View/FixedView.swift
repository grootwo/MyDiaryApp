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
    var body: some View {
        NavigationStack {
                VStack {
                    HStack {
                        SearchView(textInput: $searchText)
                        ViewToggle(isCalendarView: $isCalendarView)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: MakeDiaryView()) {
                            Image(systemName: "pencil.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.accent)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                }
                .padding()
        }
    }
}

#Preview {
    FixedView(isCalendarView: .constant(true))
}
