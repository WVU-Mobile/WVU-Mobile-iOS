//
//  ViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 1/31/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {    
    
    var colors: UIColors = UIColors.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUIColors()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contentSizeDidChangeNotification:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    // IDK
    private func contentSizeDidChangeNotification(notification: NSNotification) {
        if let userInfo: NSDictionary = notification.userInfo {
            self.contentSizeDidChange(userInfo[UIContentSizeCategoryNewValueKey] as String)
        }
    }
    
    // IDK
    func contentSizeDidChange(size: String) {
        // Implement in subclass
    }
    
    // Set status bar color.
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        if colors.nightModeToggle {
            return UIStatusBarStyle.LightContent
        }
        else {
            return UIStatusBarStyle.Default
        }
    }
    
    // Set UI colors.
    func setUIColors() {
        UIApplication.sharedApplication().statusBarStyle = preferredStatusBarStyle()
    }
}
