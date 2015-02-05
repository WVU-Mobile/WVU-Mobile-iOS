//
//  ViewController.swift
//  WVU Mobile
//
//  Created by Richard Deal on 1/28/15.
//  Copyright (c) 2015 WVUMobile. All rights reserved.
//

import UIKit

class MainViewController: CenterViewController {
    var wv: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wv = UIImageView(image: UIImage(named: "mount-2.png"))
        wv?.image = wv?.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        wv?.tintColor = colors.textColor
        self.navigationItem.titleView = wv
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init() {
        super.init()
        self.restorationIdentifier = "MainViewController"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "MainViewController"
    }
    
    override func setUIColors() {
        super.setUIColors()
        wv?.tintColor = colors.textColor
    }
}
