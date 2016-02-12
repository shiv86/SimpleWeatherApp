//
//  ForecastService.swift
//  Stormy
//
//  Created by Shivam Sinha on 2/11/16.
//  Copyright (c) 2016 Treehouse. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String){
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)){
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            let networkOperation = NetworkOperation(url:forecastURL)
            
            networkOperation.downloadJSONFromURL{
                (let JSONDictionary) in
                //do something
                let currentWeather = self.currentWeahterFromJSON(JSONDictionary)
            }
            
        } else {
            println("Could not construct a valid URL")
        }
    }
    
    func currentWeahterFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            println("JSON dictionary return nil for 'currently' key")
            return nil
        }
        
    }
    
}