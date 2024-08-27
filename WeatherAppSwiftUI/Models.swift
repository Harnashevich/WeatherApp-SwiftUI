//
//  Models.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    var headerViewModel = HeaderViewModel()
}

class HeaderViewModel: ObservableObject {
    var location: String = "New york city, NY"
    var currentTemp: String = "75°"
    var currentConditions = "Clear"
}
