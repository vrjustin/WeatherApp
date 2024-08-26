//
//  APIEndpoint.swift
//  WeatherApp
//
//  Created by Justin Maronde on 8/26/24.
//

import Foundation

enum APIEndpoint {
    
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByLocation(String)
    case weatherByLatLon(Double, Double)
    
    private var weatherAPIKey: String {
        guard let filePath = Bundle.main.path(forResource: "api-keys", ofType: "plist") else {
            fatalError("Could not find the necessary path for the bundle of apiKeys!")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let apiKey = plist?.object(forKey: "weatherAPIKey") as? String else {
            fatalError("Could not retrieve weatherAPIKey from bundle!")
        }
        return apiKey
    }
    
    private var path: String {
        switch self {
            case .coordinatesByLocation(let city):
                return "/geo/1.0/direct?q=\(city)&appId=\(weatherAPIKey)"
            case .weatherByLatLon(let lat, let lon):
                return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appId=\(weatherAPIKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
}
