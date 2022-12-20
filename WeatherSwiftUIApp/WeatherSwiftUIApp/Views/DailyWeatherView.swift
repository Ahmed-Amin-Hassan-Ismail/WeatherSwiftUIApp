//
//  DailyWeatherView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ForEach(cityViewModel.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
}

extension DailyWeatherView {
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            
            Text(cityViewModel.getDayFor(timeStamp: weather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityViewModel.getTempFor(temp: weather.temp.max)) | \(cityViewModel.getTempFor(temp: weather.temp.min))")
                .frame(width: 150)
            
            Spacer()
            
            Image.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(
                    LinearGradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.7)],
                                   startPoint: .top, endPoint: .bottom))
        )
        .shadow(color: .white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(cityViewModel: CityViewModel())
    }
}
