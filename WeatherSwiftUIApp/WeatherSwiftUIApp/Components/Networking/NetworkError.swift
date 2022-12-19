//
//  NetworkError.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 19/12/2022.
//

import Foundation



enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}
