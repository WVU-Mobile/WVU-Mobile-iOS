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
        let url = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        
        var data = NSData(contentsOfURL: url)
        var err: NSError?
        
        let jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
        
        if (err != nil) {
            println("JSON Error \(err!.localizedDescription)")
        }else{
            self.message = jsonResult["message"] as NSString
            self.status = jsonResult["status"] as NSString
        }
    }
}
