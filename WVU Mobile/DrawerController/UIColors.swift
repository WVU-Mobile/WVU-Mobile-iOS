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
    let darkGoldColor = UIColor(red: 150/255, green:150/255, blue:140/255, alpha:1.0)
    let grayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
    let darkBlueColor = UIColor(red: 2/255, green:51/255, blue:110/255, alpha:1.0) //#00518d
    let blackColor = UIColor(red:0/255, green:21/255, blue:40/255, alpha:1.0)
    let clayColor = UIColor(red:0/255, green:15/255, blue:35/255, alpha:1.0)
    let blueColor = UIColor(red: 0/255, green: 145/255, blue: 234/255, alpha: 1.0)
    let blueHeaderColor = UIColor(red: 25/255, green: 50/255, blue: 75/255, alpha: 1.0) //19324b
    let alphaGrayColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.4)
    let selectBlueColor = UIColor(red: 2/255, green:42/255, blue:82/255, alpha:1.0) //#012a52
    
    //#0078cd
    let brightBlue = UIColor(red: 0/255, green: 120/255, blue: 205/255, alpha: 1.0)
    
    //PRT Colors
    let greenColor = UIColor(red: 179/255, green: 214/255, blue: 148/255, alpha: 1.0)   //#b3d694
    let orangeColor = UIColor(red: 223/255, green: 148/255, blue: 3/255, alpha: 1.0)  //#df9403
    let redColor = UIColor(red: 192/255, green: 25/155, blue: 25/155, alpha: 1.0)     //rgb(192, 57, 43)
    let prtGray1 = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1.0) //#575757
    let prtGray2 = UIColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1.0) //#cbcbcb
    let prtGray3 = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0) //#a2a2a2
    let pinkColor = UIColor(red: 255/255, green: 200/255, blue: 200/255, alpha: 1.0) //#fea094
    
    //Home screen alpha
    let homeGrayColor = UIColor(red:45/255, green:45/255, blue:45/255, alpha:0.8)
    let homeBlackColor = UIColor(red:0/255, green:21/255, blue:40/255, alpha:0.9)
    let homeDarkBlueColor = UIColor(red: 25/255, green: 50/255, blue: 75/255, alpha: 0.9)
    
    
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