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
    var nightModeToggle: Bool = true
    
    // Preset colors
    let yellowColor = UIColor(red:255/255, green:240/255, blue:206/255, alpha: 1.0)
    let goldColor = UIColor(red: 235/255, green:211/255, blue:140/255, alpha:1.0)
    let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
    let darkBlueColor = UIColor(red: 2/255, green:52/255, blue:98/255, alpha:1.0)
    let blackColor = UIColor(red:0/255, green:21/255, blue:40/255, alpha:1.0)
    let clayColor = UIColor(red:0/255, green:15/255, blue:35/255, alpha:1.0)
    let blueColor = UIColor(red: 0/255, green: 145/255, blue: 234/255, alpha: 1.0)
    let alphaGrayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.4)

    
    override init() {
        super.init()
        self.toggleUIColors()
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
            navBarColor = blueColor
            mainViewColor = yellowColor
            menuViewColor = yellowColor
            textColor = blackColor
            selectColor = UIColor.whiteColor()
        case true:
            navBarColor = darkBlueColor
            mainViewColor = blackColor
            menuViewColor = clayColor
            textColor = goldColor
            selectColor = alphaGrayColor
        default:
            break
        }
    }
}