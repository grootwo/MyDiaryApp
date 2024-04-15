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
                HStack {
                    SearchView(textInput: $searchText)
                    HStack {
                        Button(action: {
                            print("calendar button clicked")
                        }, label: {
                            Image(systemName: "calendar")
                        })
                        Button(action: {
                            print("list button clicked")
                        }, label: {
                            Image(systemName: "list.bullet")
                        })
                    }
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
