//
//  CityNameView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .bold()
                
                Text(date)
            }
            .foregroundColor(.white)
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView(city: "San Francisco", date: "13-12-2022")
    }
}
