//
//  API+EXT.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 19/12/2022.
//

import Foundation


extension API {
    
    static let baseURLString = "https://api.openweathermap.org/data/3.0/"
    
    static func getURLFor(lat: Double, Long: Double) -> String {
       // return "\(baseURLString)onecall?lat=\(lat)&lon=\(Long)&exclude=minutely&appid=\(apiKey)&units=imperial"
        return "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(Long)&exclude=current&appid=\(apiKey)"
    }
}
