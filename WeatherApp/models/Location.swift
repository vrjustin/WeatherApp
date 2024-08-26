//
//  Location.swift
//  WeatherApp
//
//  Created by Justin Maronde on 8/26/24.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
