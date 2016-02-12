//
//  ViewController.swift
//  Stormy
//
//  Created by Shivam Sinha on 2/9/16.
//  Copyright (c) 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel?
    @IBOutlet weak var currentHumid: UILabel?
    @IBOutlet weak var currentRain: UILabel?
    
    
    private let forecastAPIKey = "3b485b062e2a9bbf8851daf65b7846cc"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
        
        //Data object to fetch weather data
         /* 
            let weatherData = NSData(contentsOfURL: forecastURL!, options: nil, error: nil)
            println(weatherData)
         */
        
        //Use NSURLSessionAPI to fetch data
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        
        let request = NSURLRequest(URL: forecastURL!)
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(data)
        })
        

        dataTask.resume()
        
                
        /*
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
            let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject]
        {
            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
            
            currentTempLabel?.text = "\(currentWeather.temperature)º"
            currentHumid?.text = "\(currentWeather.humidity)%"
            currentRain?.text = "\(currentWeather.precipProbability)%"
            
            println(plistPath)
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






