//
//  JSONDecoder.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/10/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import Foundation

class JSONDecoder {
    
    var status: NSString
    var message: String
    var timestamp: Int!
    var stations: NSArray
    var bussesDispatched: Bool
    var duration: NSArray
    
    init() {
        self.status = ""
        self.message = ""
        self.timestamp = Int(NSDate().timeIntervalSince1970)
        self.stations = []
        self.bussesDispatched = false
        self.duration = []
        
    }
    
    func pullJSON() {
        var urlPath: String = "https://prtstatus.wvu.edu/api/\(timestamp)/?format=json"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlPath)
        var data = NSData(contentsOfURL: url!)
        var request = NSURLRequest(URL: url!)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {data, urlResponse, error in var jsonErrorOptional: NSError?
            let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
            if let json = jsonOptional as? Dictionary<String, AnyObject> {
                
            }
        }
    }
    
}
