//
//  CityViewModel.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import Foundation
import CoreLocation


final class CityViewModel: ObservableObject {
    
    //MARK: - Published
    @Published var weather = WeatherResponse.empty()
    @Published var city = "San Francisco" {
        didSet {
            getLocation()
        }
    }
    
    //MARK: - Init
    init() {
        getLocation()
    }
    
    //MARK: - Formatter
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        
        return formatter
    }()
    
    //MARK: - Variables
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    //MARK: - Methods
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getTimeFor(timeStamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    func getDayFor(timeStamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    //MARK: - Core Location
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coordinate: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coordinate: CLLocationCoordinate2D?) {
        let urlString = API.getURLFor(lat: coordinate?.latitude ?? 37.5485,
                                      Long: coordinate?.longitude ?? -121.9886)
        getWeatherInternal(city: city, urlString: urlString)
    }
    
    private func getWeatherInternal(city: String, urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
    func getLottieAnimationFor(icon: String) -> String {
        switch icon {
        case "Old":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "davBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "99d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstorm"
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
        case "50d":
            return "dayMist"
        case "50n":
            return "dayMist"
        default:
            return "dayClearSky"
            
        }
    }
}

