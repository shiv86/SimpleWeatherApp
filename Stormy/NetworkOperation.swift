//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Shivam Sinha on 2/10/16.
//  Copyright (c) 2016 Treehouse. All rights reserved.
//

import Foundation


class NetworkOperation {
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL){
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
        let request = NSURLRequest(URL:  queryURL)
        let dataTask = session.dataTaskWithRequest(request){
            (let data, let response, let error) in
                //1. Check HTTP response for sucessful GET request
            if let httpResponse = response as? NSHTTPURLResponse {
                
                let statusCode = httpResponse.statusCode
                
                switch(statusCode) {
                case 200:
                    //2. Create JSON object with data
                    let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
                        completion(jsonDictionary)
                default:
                    println("GET request not successful. HTTP status code: \(statusCode)")
                }
            } else {
                println("Error: Not a valid HTTP response")
            }
        }
        
        dataTask.resume()
    }
    
    
    
    
    
}