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
    var startDate: NSDate!
    var endDate: NSDate!
    var title: String!
    var link: String!
    var descrip: String!
    var location: String!

    override init() {
        super.init()
    }
    
    func decode(){
        self.descrip = formatDescription(descrip)
    }
    
    func formatDescription(rawDescript: String) -> String {
        let htmlString = String(rawDescript).htmlToString
        
        println(htmlString)
        
        return htmlString
    }
}