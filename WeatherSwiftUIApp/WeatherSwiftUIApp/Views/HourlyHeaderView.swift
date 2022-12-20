//
//  HourlyHeaderView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI

struct HourlyHeaderView: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityViewModel.weather.hourly) { weather in
                    let icon = Image.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityViewModel.getTimeFor(timeStamp: weather.dt)
                    let temp = cityViewModel.getTempFor(temp: weather.temp)
                    
                    getHourlyView(hour: hour, image: icon, temp: temp)
                }
            }
            .padding()
        }
    }
}

//MARK: - Methods
extension HourlyHeaderView {
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
            
            image
                .foregroundColor(.yellow)
            
            Text(temp)
        }
        .foregroundColor(.white)
        .padding()
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

struct HourlyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyHeaderView(cityViewModel: CityViewModel())
    }
}
