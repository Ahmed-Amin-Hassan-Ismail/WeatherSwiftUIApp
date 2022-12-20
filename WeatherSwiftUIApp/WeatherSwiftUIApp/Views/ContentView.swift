//
//  ContentView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 19/12/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cityViewModel = CityViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityViewModel: cityViewModel)
                
                ScrollView(.vertical, showsIndicators: false) {
                    CityView(cityViewModel: cityViewModel)
                }
            }
            .padding(.top, 60)
        }
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(
                    LinearGradient(colors: [Color.blue.opacity(0.4), Color.blue.opacity(0.8)],
                                   startPoint: .top, endPoint: .bottom))
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
