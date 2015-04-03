//
//  Events.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/9/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import Foundation

class Events: NSObject {
    var events = NSMutableArray()
    var url = "https://cal.wvu.edu/RSSSyndicator.aspx?category=&location=&type=N&binary=Y"
    
    override init() {
        super.init()
        pullRSS()
    }
    
    class var sharedInstance: Events{
        struct Static {
            static let instance : Events = Events()
        }
        return Static.instance
    }
    
    func pullRSS (){
        var nsURL = NSURL(string: url)!
        var parser: RSSParser = RSSParser.alloc().initWithURL(nsURL) as RSSParser
        var feed = parser.feeds
        
        for var i = 0; i < feed.count; i++ {
            let fTitle: String = feed[i].objectForKey("title") as String
            let fDescript: String = feed[i].objectForKey("description") as String
            let fLink: String = feed[i].objectForKey("link") as String
            let fDate: String = feed[i].objectForKey("pubDate") as String
            
            var event = EventObject()
            event.title = fTitle
            event.link = fLink
            event.startDate = formatDate(fDate)
            event.descrip = fDescript
                        
            events.addObject(event)
        }
    }
    
    func eventsOnDay(date: NSDate) -> NSMutableArray {
        var todaysEvents = NSMutableArray()
        let calender = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        for e in events {
            var tempE = e as EventObject
            let dif = calender?.compareDate(date, toDate: tempE.startDate, toUnitGranularity: .DayCalendarUnit)
            if dif == NSComparisonResult.OrderedSame{
                todaysEvents.addObject(tempE)
            }
        }
        
        return todaysEvents
    }
    
    func formatDate(rawDate: String) -> NSDate{
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss 'GMT\n'"
        var date: NSDate = dateFormatter.dateFromString(rawDate)!
        
        return date
    }
}