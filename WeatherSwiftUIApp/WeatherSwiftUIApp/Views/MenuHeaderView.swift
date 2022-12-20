//
//  MenuHeaderView.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 20/12/2022.
//

import SwiftUI

struct MenuHeaderView: View {
    @ObservedObject var cityViewModel: CityViewModel
    @State private var cityName: String = "San Francisco"
    
    var body: some View {
        
        ZStack {
            Color.blue.opacity(0.5)
            
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                
                TextField("", text: $cityName)
                   
                
                Spacer()
                
                Button {
                    cityViewModel.city = cityName
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                        
                        Image(systemName: "location.fill")
                    }
                    .padding(.trailing,10)
                }
                .frame(width: 75, height: 50)

            }
            .foregroundColor(.white)
        }
        .frame(height: 100)
        .cornerRadius(10)
        //.frame(minWidth: 150, maxWidth: .infinity)
        .padding()
        
        
//        HStack {
//            TextField("", text: $cityName)
//                .padding(.leading, 20)
//
//            Button {
//                cityViewModel.city = cityName
//            } label: {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.blue)
//
//                    Image(systemName: "location.fill")
//                }
//            }
//            .frame(width: 50, height: 50)
//        }
//        .foregroundColor(.white)
//        .padding()
//        .background(
//            ZStack(alignment: .leading, content: {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(.white)
//                    .padding(.leading, 10)
//
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.blue.opacity(0.5))
//
//            })
//            //.padding(.horizontal)
//        )
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeaderView(cityViewModel: CityViewModel())
    }
}
