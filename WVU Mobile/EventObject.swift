//
//  EventObject.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/9/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit
import Foundation

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
}