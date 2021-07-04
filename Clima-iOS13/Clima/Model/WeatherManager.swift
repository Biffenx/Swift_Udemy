//
//  WeatherManager.swift
//  Clima
//
//  Created by Jochum Wilen on 29.6.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManger: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5bfd13719c732e869752594308b4de30&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        preformRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        preformRequest(with: urlString)
    }
    
    func preformRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
    
        }
    }
        func parseJSON(_ weatherData: Data) -> WeatherModel?{
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Weatherdata.self, from: weatherData)
                let id = decodedData.weather[0].id
                let name = decodedData.name
                let temp = decodedData.main.temp
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                return weather
                
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
   
    
    }
    
