//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Shivam Sinha on 2/9/16.
//  Copyright (c) 2016 Treehouse. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Int
    let humidity: Int
    let precipProbability: Int
    let summary: String
    
    init(weatherDictionary: [String: AnyObject]){
        temperature = weatherDictionary["temperature"] as! Int
        let humidFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidFloat * 100)
        let precipFloat = weatherDictionary["precipProbability"] as! Double
        precipProbability = Int(precipFloat * 100)
        summary = weatherDictionary["summary"] as! String
        
    }
}