//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Justin Maronde on 8/26/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
