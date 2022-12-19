//
//  DailyWeather.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 19/12/2022.
//

import Foundation


struct DailyWeather: Codable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetails]
    
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature (min: 0.0, max: 0.0)
        weather = [WeatherDetails (main: "", description: "", icon: "")]
    }
}

extension DailyWeather: Identifiable {
    var id: UUID {
        return UUID()
    }
}

