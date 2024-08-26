//
//  MeasurementFormatter+Extension.swift
//  WeatherApp
//
//  Created by Justin Maronde on 8/26/24.
//

import Foundation

extension MeasurementFormatter {
    static func temperature(value: Double) -> String {
        let numFormatter = NumberFormatter()
        numFormatter.maximumFractionDigits = 0
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numFormatter
        
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)
        
        return formatter.string(from: temp)
    }
}
