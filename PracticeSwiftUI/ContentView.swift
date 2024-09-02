//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 김상규 on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("HELLO.\nMY POLAROID")
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.blue)
                    .bold()
                
                Image("launchImage")
                    .imageScale(.large)
                
                Spacer()
                
                NavigationLink("시작하기") {
                    SetProfileView()
                }
                .asCustomButtomModifier(textColor: .white, bgColor: .blue)
                .padding(.horizontal)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
