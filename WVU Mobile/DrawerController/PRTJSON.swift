//
//  JSONDecoder.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/10/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import Foundation

class PRTJSON {
    
    var status: NSString
    var message: NSString
    var timestamp: Int!
    var stations: NSArray
    var bussesDispatched: NSString
    var duration: NSArray
    
    init() {
        self.status = ""
        self.message = ""
        self.timestamp = Int(NSDate().timeIntervalSince1970)
        self.stations = []
        self.bussesDispatched = ""
        self.duration = []
        self.pullJSON()
    }
    
    //{"status":"1","message":"The PRT is running on a normal schedule.","timestamp":"1424205918","stations":[],"bussesDispatched":"0","duration":[]}
    func pullJSON() {
        var timestamp = Int(NSDate().timeIntervalSince1970)
        let urlPath: String = "https://prtstatus.wvu.edu/api/\(timestamp)/?format=json"
        print(urlPath)
        let url = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        
        var data = NSData(contentsOfURL: url)
        var err: NSError?
        
        let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: &err)
        
        if (jsonResult == nil) {
            println("JSON Error \(err!.localizedDescription)")
        }
        else {
            var jsonResultDictionary = jsonResult as NSDictionary
            self.message = jsonResultDictionary["message"] as NSString
            self.status = jsonResultDictionary["status"] as NSString
        }
    }
}
