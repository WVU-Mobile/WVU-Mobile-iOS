//
//  HomeViewController.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class HomeViewController: CenterViewController {
    
    var titles = ["NEWS",
                  "PRT STATUS",
                  "DINING HALL",
                  "BUSES"]
    
    override func viewDidLoad() {
        self.title = "H O M E"
        
        setUIColors()
        super.viewDidLoad()
    }
    
    // Set UI colors.
    override func setUIColors() {
        super.setUIColors()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "HomeViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "HomeViewController"
    }
}