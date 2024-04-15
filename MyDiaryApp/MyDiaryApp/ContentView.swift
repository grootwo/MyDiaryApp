//
//  ContentView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDay = Date()
    @State var searchText = ""
    var body: some View {
        ZStack {
            DatePicker("", selection: $selectedDay, displayedComponents: [.date])
                .datePickerStyle(.graphical)
            VStack {
                SearchView(textInput: $searchText)
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        print("Click new diary button")
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                    })

                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
