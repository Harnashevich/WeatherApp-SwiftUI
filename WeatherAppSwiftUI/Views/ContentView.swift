//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .blue,
                    Color(.link),
                    .orange
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HeaderView()
                    HourlyView()
                    DailyView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WeatherViewModel())
}
