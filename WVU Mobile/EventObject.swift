//
//  EventObject.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/9/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import Foundation

extension String {
    var htmlToString:String {
        return NSAttributedString(data: dataUsingEncoding(NSUTF8StringEncoding)!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil, error: nil)!.string
    }
    var htmlToNSAttributedString:NSAttributedString {
        return NSAttributedString(data: dataUsingEncoding(NSUTF8StringEncoding)!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil, error: nil)!
    }
}

class EventObject: NSObject {
    var decoded = false
    var startDate: NSDate!
    var endDate: NSDate!
    var title: String!
    var link: String!
    var descrip = ""
    var location: String!
    
    var time = ""
    var startT: String = ""
    var endT: String = ""

    override init() {
        super.init()
    }
    
    func decode(){
        if decoded == false {
            let d2 = formatDescription(descrip)
            descrip = ""
            
            var stuffArr = d2.componentsSeparatedByString("\n")
            
            if stuffArr.count > 8 {
                startT = stuffArr[3]
                endT = stuffArr[7]
                
                if startT == "" && endT == "" {
                    time = "Time TBA"
                } else if endT == "" {
                    time = startT
                } else {
                    time = "\(startT) - \(endT)"
                }
                
                for i in 7...stuffArr.count-1 {
                    descrip = descrip + stuffArr[i] + "\n"
                }
            }
            decoded = true
        }
    }
    
    func formatDescription(rawDescript: String) -> String {
        let htmlString = String(rawDescript).htmlToString
        
        return htmlString
    }
}