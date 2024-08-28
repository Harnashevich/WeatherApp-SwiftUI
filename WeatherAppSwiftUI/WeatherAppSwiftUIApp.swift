//
//  WeatherAppSwiftUIApp.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwiftUI

@main
struct WeatherAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = WeatherViewModel()
            ContentView().environmentObject(viewModel)
        }
    }
}
