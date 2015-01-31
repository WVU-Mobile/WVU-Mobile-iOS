//
//  MenuViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 1/30/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MenuViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "MenuViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MenuViewController"
    }
}
