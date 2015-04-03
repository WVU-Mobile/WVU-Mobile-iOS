 //
//  WorkRequestVC.swift
//  WVU Mobile
//  Created by Kaitlyn Landmesser on 3/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

 import UIKit
 
 class WorkRequestVC: CenterViewController {
    
    override func viewDidLoad() {
        self.title = "Work Request"
        
        super.viewDidLoad()
    }
    
    // Pregenerated.
    override init() {
        super.init()
        self.restorationIdentifier = "WorkViewController"
    }
    
    // Pregenerated.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "WorkViewController"
    }
 }
