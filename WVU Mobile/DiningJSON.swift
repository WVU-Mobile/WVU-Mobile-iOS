//
//  JSONDecoder.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/10/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import Foundation

class DiningJSON {
    var locationID: String!
    var day: Int!
    var month: Int!
    var year: Int!
    
    
    init() {
        var date = NSDate()
        var components = NSCalendar.currentCalendar().components(NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.YearCalendarUnit, fromDate: date)
        
        self.day = components.day
        self.month = components.month
        self.year = components.year
        
        self.pullJSON()
    }
    
    //[{"location":"3","date":"2\/18\/2015","dayofweek":"Wednesday","item":"Made to Order","meal":"BREAKFAST"},{"location":"3","date":"2\/18\/2015","dayofweek":"Wednesday","item":"\"Eggs,Omelets\"","meal":"BREAKFAST"},{"location":"3","date":"2\/18\/2015","dayofweek":"Wednesday","item":"Burritos","meal":"BREAKFAST"}]
    func pullJSON() {
        let urlPath: String = "http://diningmenuservice.wvu.edu/\(locationID)/\(day)/\(month)/\(year)/1410376600000/?callback=jsonp1410376600000"
        let url = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        
        var data = NSData(contentsOfURL: url)
        var err: NSError?
        
        let jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
        
        if (err != nil) {
            println("JSON Error \(err!.localizedDescription)")
        }else{
        }
    }
}