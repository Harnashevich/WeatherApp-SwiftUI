//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .blue,
                    Color(.link),
                    .white
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                HeaderView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
