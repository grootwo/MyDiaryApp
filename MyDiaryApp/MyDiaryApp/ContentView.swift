//
//  ContentView.swift
//  MyDiaryApp
//
//  Created by Groo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDay = Date()
    var body: some View {
        ZStack {
            DatePicker("", selection: $selectedDay, displayedComponents: [.date])
                .datePickerStyle(.graphical)
            VStack {
                HStack {
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
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
