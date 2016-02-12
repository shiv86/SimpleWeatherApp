//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"




typealias BlogPostCompletion = (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void

func fetchTreehouseBlogPosts(completion: BlogPostCompletion){
    println("test")
}


private let forecastAPIKey = "3b485b062e2a9bbf8851daf65b7846cc"
let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)

let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: configuration)


let request = NSURLRequest(URL: forecastURL!)

let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
    println("test")
})


dataTask.resume()



