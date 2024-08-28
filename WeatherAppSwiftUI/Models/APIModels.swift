//
//  APIModels.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 28.08.24.
//

import Foundation

struct APIResponse: Codable {
    let lat: Float
    let lon: Float
    let current: Current
    let hourly: [HourModel]
    let daily: [DayModel]
}

struct Current: Codable {
    let temp: Double
    let weather: [Info]
}

// Hourly
struct HourModel: Codable {
    let dt: Float
    let temp: Double
    let weather: [Info]
}

struct Info: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// Daily

struct DayModel: Codable {
    let dt: Float
    let temp: Temp
}

struct Temp: Codable {
    let min: Double
    let max: Double
}
