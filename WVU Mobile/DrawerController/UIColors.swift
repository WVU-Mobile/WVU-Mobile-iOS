//
//  UIColors.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/4/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.

import UIKit
import Foundation

class UIColors: NSObject {
    var navBarColor: UIColor!
    var mainViewColor: UIColor!
    var menuViewColor: UIColor!
    var selectColor: UIColor!
    var textColor: UIColor!
    var nightModeToggle: Bool = false
    
    // Preset colors
    let lightBlueColor = UIColor(red: 159/255, green: 197/255, blue: 232/255, alpha: 1.0)
    let yellowColor = UIColor(red: 255/255, green: 242/255, blue: 204/255, alpha: 1.0)
    let goldColor = UIColor(red: 235/255, green:211/255, blue:140/255, alpha:1.0)
    let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
    let darkBlueColor = UIColor(red: 2/255, green:52/255, blue:98/255, alpha:1.0)
    let blackColor = UIColor(red:0/255, green:21/255, blue:40/255, alpha:1.0)
    let clayColor = UIColor(red:0/255, green:15/255, blue:35/255, alpha:1.0)
    let pictonBlue = UIColor(red: 89/255, green: 171/255, blue: 227/255, alpha: 1.0)
    
    override init() {
        navBarColor = pictonBlue
        mainViewColor = goldColor
        menuViewColor = grayColor
        textColor = blackColor
        selectColor = UIColor.whiteColor()
    }
    
    class var sharedInstance: UIColors{
        struct Static {
            static let instance : UIColors = UIColors()
        }
        return Static.instance
    }
    
    func toggleUIColors (){
        switch nightModeToggle {
        case false:
            navBarColor = pictonBlue
            mainViewColor = goldColor
            menuViewColor = grayColor
            textColor = blackColor
            selectColor = UIColor.whiteColor()
        case true:
            navBarColor = darkBlueColor
            mainViewColor = blackColor
            menuViewColor = clayColor
            textColor = goldColor
            selectColor = UIColor.grayColor()
        default:
            break
        }
    }
}