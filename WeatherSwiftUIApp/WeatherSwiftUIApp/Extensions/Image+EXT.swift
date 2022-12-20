//
//  Image+EXT.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI

extension Image {
    
    static func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image (systemName: "sun.max.fill") //"clear_sky_day"
        case "01n":
            return Image (systemName: "moon.fill") //"clear_sky_night"
        case "02d":
            return Image (systemName: "cloud.sun.fill") //"few_clouds_day"
        case "02n":
            return Image(systemName: "cloud.moon.fill") //"few_clouds_night"
        case "03d":
            return Image (systemName: "cloud. fill") //"scattered_clouds"
        case "03n":
            return Image(systemName: "cloud.fill") //"scattered_clouds"
        case "94d":
            return Image (systemName: "cloud.fill") //"broken_clouds"
        case "04n":
            return Image(systemName: "cloud.fill") //"broken_clouds"
        case "09d":
            return Image (systemName: "cloud.drizzle.fill") //"shower_rain"
        case "09n":
            return Image (systemName: "cloud.drizzle.fill") //"shower_rain"
        case "10d":
            return Image (systemName: "cloud.heavyrain.fill")//"rain_day"
        case "10n":
            return Image (systemName: "cloud. heavyrain.fill") //"rain_night"
        case "11d":
            return Image (systemName: "cloud.bolt.fill") //"thunderstorm_day"
        case "11n":
            return Image(systemName: "cloud.bolt.fill") //"thunderstorm_night"
        case "13d":
            return Image (systemName: "cloud.snow.fill") //"snow"
        case "13n":
            return Image (systemName: "cloud.snow.fill") //"snow"
        case "50d":
            return Image (systemName: "cloud. fog.fill") //"mist"
        case "50n":
            return Image (systemName: "cloud. fog.fill") //"mist"
        default:
            return Image (systemName: "sun.max.fill")
        }
    }
    
}
