//
//  CityView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city,
                         date: cityViewModel.date)
            .shadow(radius: 0)
            
            TodayWeatherView(cityViewModel: cityViewModel)
                .padding()
            
            HourlyHeaderView(cityViewModel: cityViewModel)
            
            DailyWeatherView(cityViewModel: cityViewModel)
                        
        }
       // .padding(30)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(cityViewModel: CityViewModel())
    }
}
