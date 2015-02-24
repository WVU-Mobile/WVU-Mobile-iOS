//
//  DiningHallViewController.swift
//  WVU Mobile
//
//  Created by Kaitlyn Landmesser on 2/21/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class DiningHallViewController: ViewController {
    
    override func viewDidLoad() {
        self.title = "D I N I N G"
        //JSON Objects
        //var diningInfo = DiningJSON()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "PRTViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "PRTViewController"
    }
    
    override func setUIColors() {
        self.view.backgroundColor = self.colors.mainViewColor
    }
}
