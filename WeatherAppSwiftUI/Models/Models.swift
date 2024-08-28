//
//  Models.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var headerViewModel = HeaderViewModel()
    @Published var hourlyData: [HourData] = []
    @Published var dailyData: [DayData] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        // get data and location info
        LocationManager.shared.getLocation { location in
            LocationManager.shared.resolveName(for: CLLocation(latitude: location.lat,
                                                               longitude: location.lon)
            ) { name in
                DispatchQueue.main.async {
                    self.headerViewModel.location = name ?? "Current"
                }
            }
            
            let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(location.lat)&lon=\(location.lon)&exclude=minutely&units=imperial&appid=c0fe764b892253282a9c1701b3bf72b5"
            guard let url = URL(string: urlString) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        // Hourly
                        self.headerViewModel.currentTemp = "\(Int(result.current.temp))°F"
                        self.headerViewModel.currentConditions = result.current.weather.first?.main ?? "-"
                        self.headerViewModel.iconURLString = String.iconUrlString(for: result.current.weather.first?.icon ?? "")
                        // Hourly
                        self.hourlyData = result.hourly.compactMap({
                            let data = HourData()
                            data.temp = "\(Int($0.temp))°"
                            data.hour = String.hour(from: $0.dt)
                            data.imageURL = String.iconUrlString(for: $0.weather.first?.icon ?? "")
                            return data
                        })
                        
                        // Daily
                        self.dailyData = result.daily.compactMap({
                            let data = DayData()
                            data.day = String.day(from: $0.dt)
                            data.high = "\($0.temp.max)°F"
                            data.low = "\($0.temp.min)°F"
                            return data
                        })
                    }
                    
                    return
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}

// MARK: - Header

class HeaderViewModel: ObservableObject {
    var location: String = "New york city, NY"
    var currentTemp: String = "75°"
    var currentConditions = "Clear"
    var iconURLString = "https://www.apple.com"
}

// MARK: - Hourly

class HourData: ObservableObject, Identifiable {
    var id = UUID()
    var temp = "55°"
    var hour = "1PM"
    var imageURL = ""
}

// MARK: - Daily

class DayData: ObservableObject, Identifiable {
    var id = UUID()
    var day = "Monday°"
    var high = "77°F"
    var low = "44°F"
}
