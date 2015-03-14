//
//  EventDateSelector.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 3/12/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import Foundation
import UIKit

class EventDateSelector: UIView {
    var datePicker: UIView!
    var date = NSDate()
    var colors = UIColors()
    var formatter = NSDateFormatter()
    var dayButton: UIButton!
    var backButton: UIButton!
    var forwardButton: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        let screenSize = UIScreen.mainScreen().bounds
        self.datePicker = UIView(frame: CGRectMake(0, 64, screenSize.width, 46))
        self.datePicker.backgroundColor = colors.selectBlueColor
        
        self.formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        self.dayButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.dayButton.frame = CGRectMake(screenSize.width/2 - 50, 5, 100, 36)
        self.dayButton.backgroundColor = colors.darkBlueColor
        self.dayButton.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        dayButton.setTitle(formatter.stringFromDate(date), forState: .Normal)
        dayButton.setTitleColor(colors.goldColor, forState: .Normal)
        dayButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 16)

        
        self.backButton = UIButton (frame: CGRectMake(screenSize.width/4 - 25, 5, 50, 36))
        self.backButton.setTitle("<", forState: .Normal)
        backButton.setTitleColor(colors.goldColor, forState: .Normal)
        backButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        self.backButton.backgroundColor = colors.darkBlueColor
        self.backButton.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)

        
        self.forwardButton = UIButton (frame: CGRectMake((screenSize.width/4) * 3 - 25, 5, 50, 36))
        self.forwardButton.setTitle(">", forState: .Normal)
        forwardButton.setTitleColor(colors.goldColor, forState: .Normal)
        forwardButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 22)
        self.forwardButton.backgroundColor = colors.darkBlueColor
        self.forwardButton.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)

        
        datePicker.addSubview(dayButton)
        datePicker.addSubview(backButton)
        datePicker.addSubview(forwardButton)
        self.addSubview(datePicker)
    }
    
    convenience override init () {
        self.init(frame:CGRectZero)
    }
    
    func click(){
        println("click")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}