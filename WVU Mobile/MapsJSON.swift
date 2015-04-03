//
//  MapsJSON.swift
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
    
    //[{"city": "Morgantown", "fsq_id": 883984, "name": "Brooks Hall", "latitude": 39.63578129, "zip": "26505", "has_features": true, "code": "BKH-D", "wifi": 1, "url": null, "id": 23, "parking": {"name": "Public Parking - ST7", "distance": 211.524063110352}, "description": "Newly renovated Brooks Hall, originally opened in 1950, houses WVU\u2019s geosciences programs\u2014geology, geography, and Geographic Information Systems (GIS). Brooks Hall is the first building on campus to incorporate a \"green roof\" planted with vegetation to reduce energy usage.", "parking_id": null, "prt": {"name": "PRT Station -  Beechurst Ave.", "distance": 102.901023864746}, "phone": null, "longitude": -79.95627254, "prt_id": null, "subtype": "Academic", "address": "98 Beechurst Ave", "attribution": "West Virginia University", "campus": "Downtown", "image": "Brooks-Hall", "has_entities": false, "state": "WV"}]
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