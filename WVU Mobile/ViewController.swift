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
    
    enum ViewTag: Int{
        case Menu = 1, Center = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUIColors()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contentSizeDidChangeNotification:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        //let tapGesture = UITapGestureRecognizer(target: self, action: "toggleNightMode")
        //tapGesture.numberOfTapsRequired = 3
        //self.navigationController?.navigationBar.addGestureRecognizer(tapGesture)
    }
    
    private func contentSizeDidChangeNotification(notification: NSNotification) {
        if let userInfo: NSDictionary = notification.userInfo {
            self.contentSizeDidChange(userInfo[UIContentSizeCategoryNewValueKey] as String)
        }
    }
    
    func contentSizeDidChange(size: String) {
        // Implement in subclass
    }
    
    // Toggle Night Mode
    func toggleNightMode() {
        colors.nightModeToggle = !colors.nightModeToggle
        colors.toggleUIColors()
        setUIColors()
    }
    
    // Status bar color
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        if colors.nightModeToggle {
            return UIStatusBarStyle.LightContent
        }
        else {
            return UIStatusBarStyle.Default
        }
    }
    
    func setUIColors() {
        UIApplication.sharedApplication().statusBarStyle = preferredStatusBarStyle()
    }
}
