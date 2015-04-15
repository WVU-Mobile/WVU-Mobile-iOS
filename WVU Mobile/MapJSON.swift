//
//  MapJSON.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/23/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import Foundation

class MapsJSON {
    
    var code: NSString!
    var web: NSString!
    var description: NSString!
    var prt: NSDictionary!
    var parking: NSDictionary!
    var phone: NSString!
    var type: NSString!
    var address: NSString!
    var campus: NSString!
    
    init(code: String) {
        self.code = code
        pullJSON()
    }
    
    func pullJSON() {
        let urlPath: String = "http://beta.campusmap.wvu.edu/api.json?api=true&bCode=\(code)"
        
        print(urlPath)
        
        let url = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        
        var data = NSData(contentsOfURL: url)
        
        var jsonError: NSError?
        
        if data == nil {
            println("error")
        } else {
            if let json = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: &jsonError) as? NSArray {
                if let jsonDict = json[0] as? NSDictionary {
                    web = jsonDict["url"] as? NSString
                    description = jsonDict["description"] as? NSString
                    prt = jsonDict["prt"] as? NSDictionary
                    parking = jsonDict["parking"] as? NSDictionary
                    phone = jsonDict["phone"] as? NSString
                    type = jsonDict["subtype"] as? NSString
                    address = jsonDict["address"] as? NSString
                    campus = jsonDict["campus"] as? NSString
                }
            } else {
                println("debug 2")

                println("JSON Error \(jsonError!.localizedDescription)")
                
            }
        }
    }
}