//
//  ViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 1/31/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contentSizeDidChangeNotification:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    private func contentSizeDidChangeNotification(notification: NSNotification) {
        if let userInfo: NSDictionary = notification.userInfo {
            self.contentSizeDidChange(userInfo[UIContentSizeCategoryNewValueKey] as String)
        }
    }
    
    func contentSizeDidChange(size: String) {
        // Implement in subclass
    }
}
