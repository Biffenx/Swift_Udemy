//
//  WeatherData.swift
//  Clima
//
//  Created by Jochum Wilen on 30.6.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct Weatherdata: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
