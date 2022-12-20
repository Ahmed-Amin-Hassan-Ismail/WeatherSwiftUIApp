//
//  NetworkManager.swift
//  WeatherSwiftUIApp
//
//  Created by Ahmed Amin on 19/12/2022.
//

import Foundation
import Alamofire

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completionHandler: @escaping (Result<T, NetworkError>) -> Void ) {
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completionHandler(.failure(.error(err: String(describing: error!))))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(json))
                
            } catch {
                completionHandler(.failure(.decodingError(err: String(describing: error))))
                
            }
        }
        .resume()
    }
}


