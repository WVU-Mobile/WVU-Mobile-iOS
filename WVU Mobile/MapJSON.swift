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
        
        print(urlPath, terminator: "")
        
        let url = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        
        let data = NSData(contentsOfURL: url)
        
        let jsonError: NSError?
        
        if data == nil {
            print("error")
        } else {
            if let json = NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSArray {
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
                print("debug 2")

                print("JSON Error \(jsonError!.localizedDescription)")
                
            }
        }
    }
}