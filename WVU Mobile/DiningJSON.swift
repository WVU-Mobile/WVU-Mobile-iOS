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
    var jsonResult: NSArray!
    
    //breakfast menus
    var breakfastSection: NSMutableArray!
    var healthyUBreakfastSection: NSMutableArray!
    var lunchSection: NSMutableArray!
    var healthyULunchSection: NSMutableArray!
    var dinnerSection: NSMutableArray!
    var healthyUDinnerSection: NSMutableArray!
    
    
    init(ID: String) {
        var date = NSDate()
        var components = NSCalendar.currentCalendar().components(NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.YearCalendarUnit, fromDate: date)
        
        self.locationID = ID
        
        self.day = components.day
        self.month = components.month
        self.year = components.year
        
        self.pullJSON()
        self.setupArrays()
    }
    
    //[{"location":"3","date":"2\/18\/2015","dayofweek":"Wednesday","item":"Made to Order","meal":"BREAKFAST"},{"location":"3","date":"2\/18\/2015","dayofweek":"Wednesday","item":"\"Eggs,Omelets\"","meal":"BREAKFAST"},{"location":"3","date":"2\/18\/2015","dayofweek":"Wednesday","item":"Burritos","meal":"BREAKFAST"}]
    func pullJSON() {
        let urlPath: String = "http://diningmenuservice.wvu.edu/\(locationID)/\(month)/\(day)/\(year)/1410376600000/?callback="
        println(urlPath)
        let url = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        
        var data = NSData(contentsOfURL: url)
        var err: NSError?
        
        self.jsonResult = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
        
        if (err != nil) {
            println("JSON Error \(err!.localizedDescription)")
        }
    }
    
    func setupArrays(){
        //Loop through every dictionary in the JSON feed
        for var i = 0; i < jsonResult.count; i++ {
            var dict = jsonResult[i] as NSDictionary
            //switch on type of menu items
            var d = dict["meal"] as NSString
            if d.isEqual(nil){
            switch d {
                case "BREAKFAST":
                    breakfastSection.addObject(d)
                case "HEALTHY \"U\" BREAKFAST":
                    healthyUBreakfastSection.addObject(d)
                case "\r\nBREAKFAST ACTION STATION ":
                    breakfastSection.addObject(d)
                case "LUNCH":
                    lunchSection.addObject(d)
                case "HEALTHY \"U\" LUNCH":
                    healthyULunchSection.addObject(d)
                case "\r\nLUNCH ACTION STATION ":
                    lunchSection.addObject(d)
                case "DINNER":
                    dinnerSection.addObject(d)
                case "HEALTHY \"U\" DINNER":
                    healthyUDinnerSection.addObject(d)
                case "\r\nDINNER ACTION STATION ":
                    dinnerSection.addObject(d)
                default:
                    break
            }
            }
        }
    }
}
